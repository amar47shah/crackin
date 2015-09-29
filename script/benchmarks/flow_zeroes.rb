require 'benchmark'
require_relative '../../lib/chapter_01/solution_08'

n = ARGV.shift.to_i
original =
  n.times.reduce([]) { |m, _| m << n.times.map { (rand * n).floor - 2 } }

Benchmark.bm do |x|
  (1..3).each do |i|
    x.report(i) do
      matrix = original.map(&:dup)
      Chapter01::Solution08.const_get("Version0#{i}").flow_zeroes matrix
    end
  end
end
