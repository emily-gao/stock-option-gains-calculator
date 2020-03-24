require './lib/solution'

describe Solution do
  describe '.call' do
    let(:input_data) { ['2', 'record 1', 'record 2', [base_date, price]] }
    let(:base_date) { '20200301' }
    let(:price) { '1.00' }
    let(:parsed_price) { 100 }
    let(:mapped_records) { double('mapped records') }
    let(:sorted_records) { double('sorted records') }
    let(:processed_records) { double('processed records') }
    let(:result) { 'result' }
    let(:call_solution) { described_class.call(input_data) }

    before(:each) do
      allow(PriceParser).to receive(:call).with(price).and_return(parsed_price)
      allow(RecordCountValidator).to receive(:call).with(provided: 2, actual: 2)
      allow(RecordsMapper).to receive(:call).
        with(['record 1', 'record 2']).
        and_return(mapped_records)
      allow(RecordsSorter).to receive(:call).with(mapped_records).and_return(sorted_records)
      allow(RecordsProcessor).to receive(:call).with(sorted_records).and_return(processed_records)
      allow(GainsCalculator).to receive(:call).
        with(
          processed_records: processed_records,
          base_date: base_date,
          market_price: parsed_price
        ).and_return(result)
    end

    it 'returns solution' do
      expect(call_solution).to eq(result)
    end
  end
end
