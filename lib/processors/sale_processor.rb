module Processors
  class SALEProcessor
    def self.call(employee_data:, record:)
      total_units_sold = record[:units]
      price_sold = record[:price]

      employee_data[:grants].each do |grant|
        # You would not exercise an option whose grant price is more than market price
        next if grant[:grant_price] >= price_sold

        units_sold = [total_units_sold, grant[:units_left]].min

        employee_data[:realized_gain] += units_sold * (price_sold - grant[:grant_price])
        grant[:units_sold] += units_sold
        grant[:units_left] -= units_sold
        total_units_sold -= units_sold

        break if total_units_sold == 0
      end

      if total_units_sold > 0
        abort(
          "ABORTED! "\
          "Employee #{record[:employee_id]} sold more units than available on #{record[:date]}."
        )
      end

      employee_data
    end
  end
end
