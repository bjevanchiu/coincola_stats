# :authority:www.coincola.com
# :method:POST
# :path:/api/contentslist/list
# :scheme:https
# accept:*/*
# accept-encoding:gzip, deflate, br
# accept-language:zh-HK
# authorization:null
# content-length:105
# content-type:application/x-www-form-urlencoded; charset=UTF-8
# cookie:__cfduid=d0d905adb8d514b0306f63b711b08834b1508150070; _csrf=dm1ZdvGE8C0j9FMi6RN58gHn; lang=zh-HK; ad_history_country_code=CN; ad_history_currency=CNY; ad_history_payment_provider=ALIPAY; _ga=GA1.2.579984909.1508150074; _gid=GA1.2.362957556.1508150074; __zlcmid=j1gpBNBdukOXEz
# origin:https://www.coincola.com
# referer:https://www.coincola.com/buy
# user-agent:Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36
# x-requested-with:XMLHttpRequest
# Form Data
# view parsed
# country_code=CN&limit=20&offset=0&sort_order=GENERAL&type=SELL&_csrf=UFF6AYjJ-d4oGg_csdWZnzGOs48rB5htgnbU
module Crawler
  class Capturer

    def get
      conn = Faraday.new(:url => 'https://www.coincola.com') do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

      response = conn.post do |req|
        req.url '/api/contentslist/list'
        req.headers['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8'
        req.headers['Cookie'] = '__cfduid=d0d905adb8d514b0306f63b711b08834b1508150070; _csrf=dm1ZdvGE8C0j9FMi6RN58gHn; lang=zh-HK; ad_history_country_code=CN; ad_history_currency=CNY; ad_history_payment_provider=ALIPAY; _ga=GA1.2.579984909.1508150074; _gid=GA1.2.362957556.1508150074; __zlcmid=j1gpBNBdukOXEz'
        req.body = 'country_code=CN&limit=100&offset=0&sort_order=GENERAL&type=SELL&_csrf=UFF6AYjJ-d4oGg_csdWZnzGOs48rB5htgnbU'
      end

      if response.success?
        contents_list = ContentsList.new(response.body)
      else
        p response.body
      end

    end

  end
end
