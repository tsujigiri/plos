# -*- encoding: utf-8 -*-
require File.expand_path('../lib/plos/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Christopher Petersen"]
  gem.email         = ["christopher.petersen@gmail.com"]
  gem.description   = %q{A Ruby library for interacting with the Public Library of Science (PLoS) API}
  gem.summary       = %q{A Ruby library for interacting with the Public Library of Science (PLoS) API}
  gem.homepage      = "https://github.com/cpetersen/plos"

  gem.add_dependency('nokogiri')
  gem.add_dependency('rest-client')
  gem.add_development_dependency('rake')
  gem.add_development_dependency('rspec')
  gem.add_development_dependency('coveralls')

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "plos"
  gem.require_paths = ["lib"]
  gem.version       = Plos::VERSION
end
