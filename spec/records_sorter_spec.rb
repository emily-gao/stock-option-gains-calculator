require './lib/records_sorter'

describe RecordsSorter do
  describe '.call' do
    let(:mapped_records) { [record_1, record_2, record_3, record_4] }
    let(:earlier_date) { '20200301' }
    let(:later_date) { '20200401' }
    let(:vest) { 'VEST' }
    let(:perf) { 'PERF' }
    let(:sale) { 'SALE' }
    let(:record_1) { { date: later_date, type: sale } }
    let(:record_2) { { date: later_date, type: perf } }
    let(:record_3) { { date: later_date, type: vest } }
    let(:record_4) { { date: earlier_date, type: perf } }
    let(:sorted_records) { [record_4, record_3, record_2, record_1] }
    let(:call_sorter) { described_class.call(mapped_records) }

    it 'returns sorted records' do
      expect(call_sorter).to eq(sorted_records)
    end
  end
end
