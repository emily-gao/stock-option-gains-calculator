require './lib/processors/vest_processor'

describe Processors::VESTProcessor do
  describe '.call' do
    let(:record) { { date: '20120101', units: 100, price: 50 } }
    let(:new_grant_data) {
      {
        vest_date: record[:date],
        units_granted: record[:units],
        units_sold: 0,
        units_left: record[:units],
        grant_price: record[:price]
      }
    }
    let(:default_employee_data) { { grants: [], realized_gain: 0 } }
    let(:call_processor) { described_class.call(employee_data: employee_data, record: record) }

    before(:each) do
      base_employee_data[:grants].push new_grant_data
    end

    context 'when employee data is nil' do
      let(:employee_data) { nil }
      let(:base_employee_data) { default_employee_data }

      it 'returns default employee data with new grant data' do
        expect(call_processor).to eq(base_employee_data)
      end
    end

    context 'when employee data is not nil' do
      let(:employee_data) {
        {
          grants: [{ units_left: 50, units_sold: 0, grant_price: 60 }],
          realized_gain: 0
        }
      }
      let(:base_employee_data) { employee_data }

      it 'returns default employee data with new grant data' do
        expect(call_processor).to eq(base_employee_data)
      end
    end
  end
end
