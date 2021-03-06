require './lib/record_count_validator'

describe RecordCountValidator do
  describe '.call' do
    let(:provided) { 10 }
    let(:call_validator) { described_class.call(provided: provided, actual: actual) }

    context 'when provided and actual match' do
      let(:actual) { provided }

      it 'returns nil' do
        expect(call_validator).to eq(nil)
      end
    end

    context 'when provided and actual do not match' do
      let(:actual) { provided + 1 }
      let(:error_message) {
        "ABORTED! Provided record count is #{provided} but actual record count is #{actual}.\n"
      }

      it 'aborts with error message' do
        expect {
          begin call_validator
          rescue SystemExit
          end
        }.to output(error_message).to_stderr
      end
    end
  end
end
