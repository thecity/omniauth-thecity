# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-thecity/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-thecity"
  gem.version       = Omniauth::TheCity::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Mark Blair", "Robert Leib"]
  gem.email         = ["mark@onthecity.org"]
  gem.description   = %q{OmniAuth Strategy for using The City's OAuth 2 Provider}
  gem.summary       = %q{OmniAuth Strategy for using The City's OAuth 2 Provider}
  gem.homepage      = "https://github.com/thecity/omniauth-thecity"
  gem.licenses      = ['MIT']
  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.1.1'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'simplecov'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end