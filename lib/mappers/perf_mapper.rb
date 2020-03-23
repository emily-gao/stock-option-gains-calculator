module Mappers
  class PERFMapper
    def self.call(record)
      {
        type: record[0],
        employee_id: record[1],
        date: record[2],
        multiplier: record[3].to_f
      }
    end
  end
end
