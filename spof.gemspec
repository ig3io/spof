# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spof/version'

Gem::Specification.new do |spec|
  spec.name          = "spof"
  spec.version       = Spof::VERSION
  spec.authors       = ["ignaciocontreras"]
  spec.email         = ["ignacio@ignacio.cat"]
  spec.description   = %q{Spotify Search & Lookup API Ruby wrapper}
  spec.summary       = %q{Spotify Search & Lookup}
  spec.homepage      = "http://github.com/ignaciocontreras/spof"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
