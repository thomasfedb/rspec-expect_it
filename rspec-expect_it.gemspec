# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/expect_it/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-expect_it"
  spec.version       = RSpec::ExpectIt::VERSION
  spec.authors       = ["Thomas Drake-Brockman"]
  spec.email         = ["thom@sfedb.com"]
  spec.description   = "Provides expect_it helpers for RSpec."
  spec.summary       = "Provides a expect_it helpers for RSpec."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rspec", ">= 3.0.0"
end
