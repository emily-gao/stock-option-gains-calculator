require_relative '../helpers/price_parser'

module Mappers
  class SALEMapper
    def self.call(record)
      {
        type: record[0],
        employee_id: record[1],
        date: record[2],
        units: record[3].to_i,
        price: PriceParser.call(record[4])
      }
    end
  end
end
