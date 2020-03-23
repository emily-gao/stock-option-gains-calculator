class GainsCalculator
  def self.call(processed_records:, base_date:, market_price:)
    output = ""

    processed_records.each do |employee_id, data|
      unrealized_gain_sum = 0
      data[:grants].each do |grant|
        next if grant[:vest_date] > base_date || grant[:grant_price] >= market_price

        unrealized_gain_sum += (grant[:units_left] * (market_price - grant[:grant_price])).round(2)
      end
      output << "#{employee_id},#{unrealized_gain_sum / 100},#{data[:realized_gain] / 100}\n"
    end

    output
  end
end
