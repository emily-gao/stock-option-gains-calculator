require_relative 'lib/solution'

def run_app
  input_data = ARGF.read.split("\n").map { |data| data.split(',') }
  Solution.call(input_data)
end

puts run_app
