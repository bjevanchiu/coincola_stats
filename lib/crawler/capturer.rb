module Crawler
  class Capturer
    attr_accessor :conn

    def initialize url = 'https://www.coincola.com'
      @conn = Faraday.new(:url => url) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def post type, options = {limit: 100, offset: 0}
      response = @conn.post do |req|
        req.url '/api/contentslist/list'
        req.headers['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8'
        req.headers['Cookie'] = "__cfduid=d0d905adb8d514b0306f63b711b08834b1508150070; _csrf=dm1ZdvGE8C0j9FMi6RN58gHn; lang=zh-HK; ad_history_country_code=CN; ad_history_currency=CNY; ad_history_payment_provider=#{options[:ad_history_payment_provider]}; _ga=GA1.2.579984909.1508150074; _gid=GA1.2.362957556.1508150074; __zlcmid=j1gpBNBdukOXEz"
        req.body = "country_code=CN&limit=#{options[:limit]}&offset=#{options[:offset]}&sort_order=GENERAL&type=#{type}&_csrf=UFF6AYjJ-d4oGg_csdWZnzGOs48rB5htgnbU"
      end
    end

    def capture_and_save_contents_list
      sell_response = post(AdvertType::SELL)
      if sell_response.success?
        contents_list = ContentsList.new(AdvertType::SELL, sell_response.body)
        contents_list.save
      else
        p sell_response.body
      end

      buy_response = post(AdvertType::BUY)
      if buy_response.success?
        contents_list = ContentsList.new(AdvertType::BUY, buy_response.body)
        contents_list.save
      else
        p buy_response.body
      end
    end

    def perform
      while(1==1)
        sleep 1
        capture_and_save_contents_list
      end
    end

  end
end
