require './lib/mappers/vest_mapper'

describe Mappers::VESTMapper do
  describe '.call' do
    let(:record) { [type, employee_id, date, units, price] }
    let(:type) { 'VEST' }
    let(:employee_id) { '001B' }
    let(:date) { '20120101' }
    let(:units) { '100' }
    let(:price) { '0.45' }
    let(:parsed_price) { 45 }
    let(:result) {
      {
        type: type,
        employee_id: employee_id,
        date: date,
        units: 100,
        price: parsed_price
      }
    }
    let(:call_mapper) { described_class.call(record) }

    before(:each) do
      allow(PriceParser).to receive(:call).with(price).and_return(parsed_price)
    end

    it 'returns hash with correct values' do
      expect(call_mapper).to eq(result)
    end
  end
end
