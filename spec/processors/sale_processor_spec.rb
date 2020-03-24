require './lib/processors/sale_processor'

describe Processors::SALEProcessor do
  describe '.call' do
    let(:employee_data) {
      {
        grants: [
          { units_left: 50, units_sold: 50, grant_price: 50 },
          { units_left: 50, units_sold: 0, grant_price: 60 }
        ],
        realized_gain: 0
      }
    }
    let(:record) { { employee_id: employee_id, date: date, units: total_units_sold, price: 100 } }
    let(:employee_id) { '001B' }
    let(:date) { '20120101' }
    let(:error_message) {
      "ABORTED! Employee #{employee_id} sold more units than available on #{date}"
    }
    let(:call_processor) { described_class.call(employee_data: employee_data, record: record) }

    context 'when total units sold is less than units available' do
      let(:total_units_sold) { 90 }
      let(:result) {
        {
          grants: [
            { units_left: 0, units_sold: 100, grant_price: 50 },
            { units_left: 10, units_sold: 40, grant_price: 60 }
          ],
          realized_gain: 4100
        }
      }

      it 'returns updated employee data' do
        expect(call_processor).to eq(result)
      end
    end

    context 'when total units sold is more than units available' do
      let(:total_units_sold) { 120 }

      it 'aborts with error message' do
        expect { call_processor }.to output(error_message).to_stderr
      end
    end
  end
end
