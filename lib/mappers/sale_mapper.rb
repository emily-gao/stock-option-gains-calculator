module Mappers
  class SALEMapper
    def self.call(record)
      {
        type: record[0],
        employee_id: record[1],
        date: record[2],
        units: record[3].to_i,
        price: (record[4].to_f * 100).to_i
      }
    end
  end
end
