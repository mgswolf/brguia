# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brguia/version'

Gem::Specification.new do |spec|
  spec.name          = "brguia"
  spec.version       = Brguia::VERSION
  spec.authors       = ["Marcelo Giovane Silva"]
  spec.email         = ["mgswolf@gmail.com"]
  spec.summary       = %q{Geração de Guias de recolhimennto}
  spec.description   = %q{Geração de Guias de recolhimennto para orgãos públicos}
  spec.homepage      = "http://github.com/mgswolf/brguia"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "yard"

end
