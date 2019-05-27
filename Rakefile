require "bundler/gem_tasks"
require "rake/testtask"
require "rake/clean"
require "rake/extensiontask"

Rake::ExtensionTask.new "my_malloc" do |ext|
  ext.lib_dir = "lib/my_malloc"
end


Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.libs << "bin"
  t.test_files = FileList['bin/*.rb']
end



require 'rake/extensiontask'
Rake::ExtensionTask.new("sgrb")

task :default => [:compile, :test]