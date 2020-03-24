require_relative 'lib/solution'

input_data = ARGF.read.split("\n").map { |data| data.split(',') }
puts Solution.call(input_data)
