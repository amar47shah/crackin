$LOAD_PATH.unshift File.expand_path './../lib', __FILE__

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*_test.rb']
end

task default: :test
