require './lib/records_sorter'

describe RecordsSorter do
  describe '.call' do
    let(:mapped_records) { [record_1, record_2, record_3, record_4, record_5, record_6] }
    let(:smaller_employee_id) { '001B' }
    let(:bigger_employee_id) { '002B' }
    let(:earlier_date) { '20200301' }
    let(:later_date) { '20200401' }
    let(:vest) { 'VEST' }
    let(:perf) { 'PERF' }
    let(:sale) { 'SALE' }
    let(:lower_price) { 500 }
    let(:higher_price) { 1000 }
    let(:record_1) { { employee_id: bigger_employee_id, date: later_date, type: sale, price: higher_price } }
    let(:record_2) { { employee_id: bigger_employee_id, date: later_date, type: sale, price: lower_price } }
    let(:record_3) { { employee_id: bigger_employee_id, date: later_date, type: perf, price: lower_price } }
    let(:record_4) { { employee_id: bigger_employee_id, date: later_date, type: vest, price: lower_price } }
    let(:record_5) { { employee_id: bigger_employee_id, date: earlier_date, type: vest, price: lower_price } }
    let(:record_6) { { employee_id: smaller_employee_id, date: earlier_date, type: vest, price: lower_price } }
    let(:sorted_records) { [record_6, record_5, record_4, record_3, record_2, record_1] }
    let(:call_sorter) { described_class.call(mapped_records) }

    it 'returns sorted records' do
      expect(call_sorter).to eq(sorted_records)
    end
  end
end
