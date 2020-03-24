require './lib/records_processor'

describe RecordsProcessor do
  let(:sorted_records) { [record_1, record_2] }
  let(:record_1) { { employee_id: '001B', type: 'DUMMY' } }
  let(:record_2) { { employee_id: '002B', type: 'DUMMY' } }
  let(:result) { { '001B' => employee_1_data, '002B' => employee_2_data } }
  let(:employee_1_data) { 'employee 1 data' }
  let(:employee_2_data) { 'employee 2 data' }
  let(:processor_klass) { Processors::DUMMYProcessor }
  let(:call_processor) { described_class.call(sorted_records) }

  before(:each) do
    allow(processor_klass).to receive(:call).
      with(employee_data: nil, record: record_1).
      and_return(employee_1_data)
    allow(processor_klass).to receive(:call).
      with(employee_data: nil, record: record_2).
      and_return(employee_2_data)
  end

  it 'returns processed data' do
    expect(call_processor).to eq(result)
  end
end

private

module Processors
  class DUMMYProcessor
    def self.call(employee_data:, record:); end
  end
end
