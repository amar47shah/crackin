require 'benchmark'
require_relative '../../lib/chapter_02/solution_01'

values, duplicates = 2.times.map { ARGV.shift.to_i }

Benchmark.bm do |x|
  %w(Linear Quadratic).each_with_index do |namespace|
    mod = Chapter02::Solution01.const_get namespace
    klass = mod.const_get 'UniqueList'
    list = klass.new
    duplicates.times { values.times { |value| list.push value } }
    x.report { list.remove_duplicates }
  end
end
