# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rover_challenge/version'

Gem::Specification.new do |spec|
  spec.name          = "rover-challenge"
  spec.version       = RoverChallenge::VERSION
  spec.authors       = ["Alexey Zolotov"]
  spec.email         = ["a.zolotov@fun-box.ru"]
  spec.summary       = %q{Catawiki coding test.}
  spec.description   = %q{Catawiki coding test.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["rover_challenge"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-its"
end
