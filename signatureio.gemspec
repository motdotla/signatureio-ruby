# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'signatureio/version'

Gem::Specification.new do |gem|
  gem.name          = "signatureio"
  gem.version       = Signatureio::VERSION
  gem.authors       = ["scottmotte"]
  gem.email         = ["scott@scottmotte.com"]
  gem.description   = %q{This gem is a wrapper for Signature.io's API.}
  gem.summary       = %q{Use this wrapper gem to query Signature.io's API, create signable documents, view signed documents, and more.}
  gem.homepage      = "https://www.signature.io"

  gem.add_development_dependency "faraday"
  gem.add_development_dependency "faraday_middleware"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
