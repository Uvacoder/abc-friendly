$:.push File.expand_path("../lib", __FILE__)
require "friendly/version"

Gem::Specification.new do |s|
    s.name      = "friendly"
    s.version   = Friendly::VERSION
    s.platform  = Gem::Platform::RUBY
    s.author    = "Arfy slowy"
    s.email     = ["slowyarfy3@gmail.com"]
    s.summary   = %q{Easily generate fake data}
    s.description = %q{Friendly, a port of Data::Friendly from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.}

    s.add_dependency('i18n', '~> 0.4')

    s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
    s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
    s.require_paths = ["lib"]
