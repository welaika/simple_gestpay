# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_gestpay/version'

Gem::Specification.new do |spec|
  spec.name          = 'simple_gestpay'
  spec.version       = SimpleGestpay::VERSION
  spec.authors       = ['Fabrizio Monti']
  spec.email         = ['fabrizio.monti@welaika.com']

  spec.summary       = 'Simple Gestpay library'
  spec.description   = 'Unofficial Banca Sella Gestpay library. \
                        It supports only Gestpay payment page method)'
  spec.homepage      = 'https://github.com/welaika/simple_gestpay'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.6'
end
