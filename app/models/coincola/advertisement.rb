class Coincola::Advertisement < ApplicationRecord
  belongs_to :advertiser

  def initialize attrs = {}
    attrs['advertiser'] = Coincola::Advertiser.new(attrs['advertiser'])
    super
  end
end
