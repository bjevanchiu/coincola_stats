module Crawler
  class ContentsList
    attr_accessor :success, :code, :message, :data, :advertisements, :total
    def initialize response_json = {}
      rs = JSON.parse(response_json)
      @success = rs['success']
      @code = rs['code']
      @message = rs['message']
      @data = rs['data']
      @advertisements = rs['data']['advertisements'].map{|o|
                          Coincola::Advertisement.find_or_initialize_by(o)}
      @total = rs['data']['total']
    end

    # def self.serialize_advertisement obj_arr
    #   obj_arr.map{|o| Coincola::Advertisement.new(obj_arr)}
    # end

    def save
      ActiveRecord::Base.transaction do
      end
    end

  end
end
