require_relative 'mappers/perf_mapper'
require_relative 'mappers/sale_mapper'
require_relative 'mappers/vest_mapper'

class RecordsMapper
  def self.call(records)
    records.each_with_index.map do |record, i|
      record_type = record[0]

      begin
        mapper_klass = Object.const_get("Mappers::#{record_type}Mapper")
      rescue NameError
        abort "ABORTED! Unsupported record type (#{record_type}) detected on row #{i + 1}."
      end

      mapper_klass.call(record)
    end
  end
end
