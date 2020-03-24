require './lib/records_mapper'

describe RecordsMapper do
  describe '.call' do
    let(:records) { [record_1, record_2]}
    let(:call_mapper) { described_class.call(records) }

    context 'when mapper class is found' do
      let(:record_1) { ['DUMMY'] }
      let(:record_2) { ['DUMMY'] }
      let(:mapped_record_1) { [type: 'DUMMY'] }
      let(:mapped_record_2) { [type: 'DUMMY'] }

      before(:each) do
        allow(Mappers::DUMMYMapper).to receive(:call).with(record_1).and_return(mapped_record_1)
        allow(Mappers::DUMMYMapper).to receive(:call).with(record_2).and_return(mapped_record_2)
      end

      it 'returns mapped records' do
        expect(call_mapper).to eq([mapped_record_1, mapped_record_2])
      end
    end

    context 'when mapper class is not found' do
      let(:record_1) { ['NOT DUMMY'] }
      let(:record_2) { ['NOT DUMMY'] }
      let(:error_message) { "ABORTED! Unsupported record type (NOT DUMMY) detected on row 1." }

      it 'aborts with error message' do
        expect { call_mapper }.to raise_error(SystemExit, error_message)
      end
    end
end
end

private

module Mappers
  class DUMMYMapper
    def self.call(record); end
  end
end
