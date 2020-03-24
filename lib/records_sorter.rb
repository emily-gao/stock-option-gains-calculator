class RecordsSorter
  ORDERED_TYPES = %w(VEST PERF SALE)

  def self.call(mapped_records)
    mapped_records.sort_by do |record|
      [record[:date], ORDERED_TYPES.index(record[:type]), record[:price]]
    end
  end
end
