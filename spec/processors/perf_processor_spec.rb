require './lib/processors/perf_processor'

describe Processors::PERFProcessor do
  describe '.call' do
    let(:record) { { multiplier: 1.5 } }
    let(:employee_data) { { grants: [{ units_left: 50 }, { units_left: 70 }] } }
    let(:result) { { grants: [{ units_left: 75 }, { units_left: 105 }] } }
    let(:call_processor) { described_class.call(employee_data: employee_data, record: record) }

    it 'returns employee data with updated units left' do
      expect(call_processor).to eq(result)
    end
  end
end
