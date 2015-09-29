require 'benchmark'
require_relative '../../lib/chapter_01/solution_08'

n = ARGV.shift.to_i
matrix = n.times.reduce([]) { |m, _| m << [*1..n] }

Benchmark.bm do |x|
  (1..3).each do |i|
    x.report(i) do
      Chapter01::Solution08.const_get("Version0#{i}").flow_zeroes matrix
    end
  end
end

=begin
➜  crackin git:(master) ✗ ruby script/benchmarks/flow_zeroes.rb 100
       user     system      total        real
1  0.000000   0.000000   0.000000 (  0.001166)
2  0.000000   0.000000   0.000000 (  0.002238)
3  0.000000   0.000000   0.000000 (  0.002879)
➜  crackin git:(master) ✗ ruby script/benchmarks/flow_zeroes.rb 1000
       user     system      total        real
1  0.110000   0.000000   0.110000 (  0.121060)
2  0.260000   0.010000   0.270000 (  0.262624)
3  0.220000   0.000000   0.220000 (  0.219962)
➜  crackin git:(master) ✗ ruby script/benchmarks/flow_zeroes.rb 10000
       user     system      total        real
1 10.350000   0.130000  10.480000 ( 10.666839)
2 22.020000   0.150000  22.170000 ( 22.326851)
3 21.610000   0.240000  21.850000 ( 22.223397)
=end
