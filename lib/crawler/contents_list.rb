module Crawler
  class ContentsList
    attr_accessor :success, :code, :message, :data, :advertisements, :total, :advert_type
    def initialize advert_type, response_json = {}
      rs = JSON.parse(response_json)
      @success = rs['success']
      @code = rs['code']
      @message = rs['message']
      @data = rs['data']
      @advertisements = rs['data']['advertisements']
      @total = rs['data']['total']
      @advert_type = advert_type
    end

    def save
      ActiveRecord::Base.transaction do
        result = self.advertisements.map do |o|
          advertiser_attr = o['advertiser'] || {}
          reputation_attr = advertiser_attr['reputation'] || {}
          advertiser = Coincola::Advertiser.find_or_initialize_by(id: advertiser_attr['id'])
          advertiser.name = advertiser_attr['name']
          advertiser.avatar = advertiser_attr['avatar']
          advertiser.state = advertiser_attr['state']
          advertiser.feedback_score = reputation_attr['feedback_score']
          advertiser.trade_count = reputation_attr['trade_count']
          advertiser.trusted_count = reputation_attr['trusted_count']
          advertiser.save!
          advertisement = Coincola::Advertisement.find_or_initialize_by(id: o['id'])
          advertisement.advert_type = @advert_type
          advertisement.country_code = o['country_code']
          advertisement.currency = o['currency']
          advertisement.max_amount = o['max_amount']
          advertisement.min_amount = o['min_amount']
          advertisement.payment_provider = o['payment_provider']
          advertisement.price = o['price']
          advertisement.advertiser_id = advertiser.id
          advertisement.save!
        end
        result.inject(&:&) ? true :false
      end
    end

  end
end
