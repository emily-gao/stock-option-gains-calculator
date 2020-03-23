module Processors
  class PERFProcessor
    def self.call(employee_data:, record:)
      employee_data[:grants].each do |grant|
        grant[:units_left] *= record[:multiplier]
      end

      employee_data
    end
  end
end
