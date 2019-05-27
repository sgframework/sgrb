require "mkmf"

abort "missing malloc()" unless have_func "malloc"
abort "missing free()"   unless have_func "free"

create_makefile "specs/specs"

Gem::Specification.new "specs", "0.0.3" do |s|
    # [...]
  
    s.extensions = %w[ext/specs/extconf.rb]
  end