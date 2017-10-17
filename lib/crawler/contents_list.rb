module Crawler
  class ContentsList
    attr_accessor :success, :code, :message, :data, :advertisements, :total
    def initialize response_json = {}
      rs = JSON.parse(response_json)
      @success = rs['success']
      @code = rs['code']
      @message = rs['message']
      @data = rs['data']
      @advertisements = Advertisement.serialize(rs['data']['advertisements'])
      @total = rs['data']['total']
    end
  end
end
