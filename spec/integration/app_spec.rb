RSpec.describe 'run_app' do
  let(:home_directory) { File.expand_path('../../../', __FILE__) }
  let(:app) { File.join(home_directory, 'app.rb') }
  let(:run_app) { system("ruby #{app} < #{input_file}") }

  [*1..3].each do |i|
    context "with input ##{i}" do
      let(:result) { File.read(File.join(home_directory, "sample_files/output_#{i}.def")) }
      let(:input_file) { File.join(home_directory, "sample_files/input_#{i}.def") }

      it "returns desired output ##{i}" do
        expect { run_app }.to output(result).to_stdout_from_any_process
      end
    end
  end
end
