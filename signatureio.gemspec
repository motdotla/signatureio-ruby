# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'signatureio/version'

Gem::Specification.new do |gem|
  gem.name          = "signatureio"
  gem.version       = Signatureio::VERSION
  gem.authors       = ["scottmotte"]
  gem.email         = ["scott@scottmotte.com"]
  gem.description   = %q{Ruby bindings for the Signature.io API.}
  gem.summary       = %q{Signature.io is the easiest way to create signable documents online. See https://www.signature.io for details.}
  gem.homepage      = "https://www.signature.io/api"

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
