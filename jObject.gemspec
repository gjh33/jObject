# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jObject/version'

Gem::Specification.new do |spec|
  spec.name          = "jObject"
  spec.version       = JObject::VERSION
  spec.authors       = ["Luke Jones"]
  spec.email         = ["manhappylife@yahoo.ca"]

  spec.summary       = %q{jObject is a gem for parsing json objects into usable ruby obejcts}
  spec.homepage      = "https://github.com/gjh33/jObject"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
