# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'equation_system/version'

Gem::Specification.new do |spec|
  spec.name          = "equation_system"
  spec.version       = EquationSystem::VERSION
  spec.authors       = ["Winston Durand"]
  spec.email         = ["me@winstondurand.com"]
  spec.summary       = %q{Generates a system of equations.}
  spec.description   = %q{Generates a system of equations made solely of integer values.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.required_ruby_version = '>= 2.0.0'
  
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0.0"
end
