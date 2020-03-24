require './lib/mappers/perf_mapper'

describe Mappers::PERFMapper do
  describe '.call' do
    let(:record) { [type, employee_id, date, multiplier] }
    let(:type) { 'VEST' }
    let(:employee_id) { '001B' }
    let(:date) { '20120101' }
    let(:multiplier) { '1.5' }
    let(:result) {
      {
        type: type,
        employee_id: employee_id,
        date: date,
        multiplier: 1.5
      }
    }
    let(:call_mapper) { described_class.call(record) }

    it 'returns hash with correct values' do
      expect(call_mapper).to eq(result)
    end
  end
end
