require './lib/helpers/price_parser'

describe PriceParser do
  describe '.call' do
    let(:price) { '0.45' }
    let(:parsed_price) { 45 }
    let(:call_parser) { described_class.call(price) }

    it 'returns parsed price' do
      expect(call_parser).to eq(parsed_price)
    end
  end
end
