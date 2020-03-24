# Parse price from string to float,
# then convert to cents
module PriceParser
  def self.call(price)
    (price.to_f * 100).to_i
  end
end
