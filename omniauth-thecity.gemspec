# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-thecity/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-thecity"
  gem.version       = Omniauth::TheCity::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Mark Blair"]
  gem.email         = ["mark@onthecity.org"]
  gem.description   = %q{OmniAuth Strategy for using The City's OAuth 2 Provider}
  gem.summary       = %q{TO DO: Write a gem summary}
  gem.homepage      = ""

  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.1.1'


  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end