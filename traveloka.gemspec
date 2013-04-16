# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'traveloka/version'

Gem::Specification.new do |spec|
  spec.name          = "traveloka"
  spec.version       = Traveloka::VERSION
  spec.authors       = ["Zidni Mubarock"]
  spec.email         = ["zidmubarock@gmail.com"]
  spec.description   = %q{Traveloka.co.id Scrapper}
  spec.summary       = %q{Traveloka.co.id Scrapper}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 3.2.12"
  spec.add_dependency "mechanize", "~> 2.6"
  spec.add_dependency "json", "~> 1.7.7"
  spec.add_development_dependency "rspec", "~> 2.12"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
