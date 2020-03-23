module Processors
  class VESTProcessor
    def self.call(employee_data:, record:)
      new(employee_data: employee_data, record: record).call
    end

    def initialize(employee_data:, record:)
      @base_employee_data = employee_data || default_employee_data
      @record = record
    end

    def call
      base_employee_data[:grants].push new_grant_data
      base_employee_data
    end

    private

    attr_reader :record
    attr_accessor :base_employee_data

    def default_employee_data
      {
        grants: [],
        realized_gain: 0
      }
    end

    def new_grant_data
      {
        vest_date: record[:date],
        units_granted: record[:units],
        units_sold: 0,
        units_left: record[:units],
        grant_price: record[:price]
      }
    end
  end
end
