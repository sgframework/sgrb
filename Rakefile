require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.libs << "bin"
  t.test_files = FileList['bin/*.rb']
end

require 'rake/extensiontask'
Rake::ExtensionTask.new("sgrb")

task :default => [:compile, :test]