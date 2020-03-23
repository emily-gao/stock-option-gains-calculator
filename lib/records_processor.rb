require_relative 'processors/perf_processor'
require_relative 'processors/sale_processor'
require_relative 'processors/vest_processor'

class RecordsProcessor
  def self.call(sorted_records)
    new(sorted_records).call
  end

  def initialize(sorted_records)
    @sorted_records = sorted_records
    @result = {}
  end

  def call
    sorted_records.each do |record|
      employee_id = record[:employee_id]
      processor_klass = Object.const_get("Processors::#{record[:type]}Processor")

      result[employee_id] = processor_klass.call(
        employee_data: result[employee_id],
        record: record
      )
    end

    result
  end

  private

  attr_reader :sorted_records
  attr_accessor :result
end
