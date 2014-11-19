# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gym/version'

Gem::Specification.new do |spec|
  spec.name          = 'gym'
  spec.version       = Gym::VERSION
  spec.authors       = ['Oscar Esgalha']
  spec.email         = ['oscaresgalha@gmail.com']
  spec.summary       = 'Put your Plain Old Ruby Object in shape!'
  spec.homepage      = 'https://github.com/oesgalha/gym'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
