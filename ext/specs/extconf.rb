require "mkmf"

abort "missing malloc()" unless have_func "malloc"
abort "missing free()"   unless have_func "free"



create_makefile("specs/specs")
create_makefile('hello_world')
Gem::Specification.new "specs", "0.1.1" do |s|
    # [...]
  
    s.extensions = %w[ext/specs/extconf.rb]

require 'rake/extensiontask'

Rake::ExtensionTask.new('specs')

  end
