require_relative 'helpers/price_parser'
require_relative 'gains_calculator'
require_relative 'record_count_validator'
require_relative 'records_mapper'
require_relative 'records_sorter'
require_relative 'records_processor'

class Solution
  def self.call(input_data)
    new(input_data).call
  end

  def initialize(input_data)
    @input_data = input_data
    @base_date = @input_data[-1][0]
    @market_price = PriceParser.call(@input_data[-1][1])
    @records = @input_data[1..-2]

    # Raise error if provided record count doesn't match actual
    validate_record_count
  end

  def call
    map_records # Map records data to hash for easy reference later
    sort_records # Sort records first by date, then by type
    # Process each grant's current state: num of units granted, sold, left,
    # and process the amount of realized gain for each employee
    # Assumption: older units are sold first because they expire earlier and likely have lower prices
    process_records
    calculate_gains # Unrealized and realized
  end

  private

  def validate_record_count
    RecordCountValidator.call(
      provided: @input_data[0][0].to_i,
      actual: @records.size
    )
  end

  def map_records
    @mapped_records = RecordsMapper.call(@records)
  end

  def sort_records
    @sorted_records = RecordsSorter.call(@mapped_records)
  end

  def process_records
    @processed_records = RecordsProcessor.call(@sorted_records)
  end

  def calculate_gains
    GainsCalculator.call(
      processed_records: @processed_records,
      base_date: @base_date,
      market_price: @market_price
    )
  end
end
