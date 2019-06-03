  Gem::Specification.new do |s|
    s.name        = 'xss'
    s.version     = '0.1.3'
    s.date        = '2019-06-03'
    s.summary     = "xSGRB!"
    s.description = "A gem to control the world!"
    s.authors     = ["0x000001"]
    s.email       = 'ads@ipool.remotewebaccess.com'
    s.files       = []
    s.files         = ["lib/xss.rb", ".travis.yml", "Gemfile", "LICENSE", "README.md", "Rakefile", "bin/console", "bin/setup", "xss.gemspec"]
    s.require_path = %w{.}
    s.extensions << 'ext/specs/extconf.rb'
    s.extra_rdoc_files = ['README.md', 'lib/docs/autobundle.md', 'doc']
    s.metadata["yard.run"] = "yri"
    s.rdoc_options << '--title' << 'Rake -- Ruby Make' <<
    '--main' << 'README' <<
    '--line-numbers'
    s.post_install_message = "Thanks for installing SGRB!"
    s.platform = Gem::Platform.local
    s.add_development_dependency 'rake-compiler'
    s.add_development_dependency 'test-unit'
    s.homepage    =
      'https://rubygems.org/gems/xss'
    s.license       = 'MIT'
  end
