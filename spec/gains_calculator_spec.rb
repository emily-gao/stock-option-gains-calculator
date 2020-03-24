require './lib/gains_calculator'

describe GainsCalculator do
  describe '.call' do
    let(:processed_records) {
      {
        "employee_1" => {
          grants: [grant_1, grant_2, not_vested_grant, high_price_grant],
          realized_gain: 10000
        },
        "employee_2" => { grants: [grant_3], realized_gain: 20050 }
      }
    }
    let(:base_date) { '20200301'}
    let(:market_price) { 100 }
    let(:before_base_date) { '20200101' }
    let(:after_base_date) { '20200401' }
    let(:high_price) { market_price + 50 }
    let(:low_price) { market_price - 50 }
    let(:grant_1) { { vest_date: before_base_date, grant_price: low_price, units_left: 50 } }
    let(:grant_2) { { vest_date: before_base_date, grant_price: low_price, units_left: 100 } }
    let(:grant_3) { { vest_date: before_base_date, grant_price: low_price, units_left: 20 } }
    let(:not_vested_grant) { { vest_date: after_base_date } }
    let(:high_price_grant) { { vest_date: after_base_date, grant_price: high_price } }
    let(:result) {
      "employee_1,75.00,100.00\n"\
      "employee_2,10.00,200.50\n"
    }
    let(:call_calculator) { described_class.call(
      processed_records: processed_records, base_date: base_date, market_price: market_price
    ) }

    it 'returns a string with the correct data' do
      expect(call_calculator).to eq(result)
    end
  end
end

