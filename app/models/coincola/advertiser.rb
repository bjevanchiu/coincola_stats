class Coincola::Advertiser < ApplicationRecord
  has_many :advertisement
  belongs_to :reputation

  def initialize attrs = {}
    attrs['reputation'] = Coincola::Reputation.new(attrs['reputation'])
    super
  end
end
