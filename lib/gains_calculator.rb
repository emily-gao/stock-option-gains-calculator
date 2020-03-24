class GainsCalculator
  def self.call(processed_records:, base_date:, market_price:)
    output = ""

    processed_records.each do |employee_id, data|
      unrealized_gain_sum = 0

      data[:grants].each do |grant|
        # Do not include grants that have not vested yet
        # Do not include grants whose grant prices is equal to or more than market price
        next if grant[:vest_date] > base_date || grant[:grant_price] >= market_price

        unrealized_gain_sum += grant[:units_left] * (market_price - grant[:grant_price])
      end

      # Divide sum by 100 since prices are records in cents
      output << "#{employee_id},"\
        "#{'%.2f' % (unrealized_gain_sum / 100.to_f)},"\
        "#{'%.2f' % (data[:realized_gain] / 100.to_f)}\n"
    end

    output
  end
end
