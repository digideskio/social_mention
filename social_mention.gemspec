# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'social_mention/version'

Gem::Specification.new do |spec|
  spec.name          = "social_mention"
  spec.version       = SocialMention::VERSION
  spec.authors       = ["Carlos Castellanos Vera"]
  spec.email         = ["ccverak@gmail.com"]
  spec.description   = %q{Provides the number of mentions of an URL on the social networks}
  spec.summary       = spec.description
  spec.homepage      = "http://github.com/ccverak/social_mention"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
