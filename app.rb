require_relative 'lib/gains_calculator'
require_relative 'lib/record_count_validator'
require_relative 'lib/records_mapper'
require_relative 'lib/records_sorter'
require_relative 'lib/records_processor'

input_data = ARGF.read.split("\n").map { |data| data.split(',') }

# Assign input data to variables
base_date = input_data[-1][0]
market_price = (input_data[-1][1].to_f * 100).to_i
records = input_data[1..-2]
provided_record_count = input_data[0][0].to_i
actual_record_count = records.size

# Raise error if provided record count doesn't match actual
RecordCountValidator.call(
  provided: provided_record_count,
  actual: actual_record_count
)

# Map records data to hash for easy reference later
mapped_records = RecordsMapper.call(records)

# Sort records first by date, then by type
sorted_records = RecordsSorter.call(mapped_records)

processed_records = RecordsProcessor.call(sorted_records)

puts GainsCalculator.call(
  processed_records: processed_records,
  base_date: base_date,
  market_price: market_price
)
