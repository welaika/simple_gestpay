# coding: utf-8
# frozen_string_literal: true

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

  spec.required_ruby_version = '>= 2.3'

  spec.add_runtime_dependency 'active_interaction', '~> 3.5', '>= 3.5.2'
  spec.add_runtime_dependency 'activesupport', '~> 5.0', '>= 5.0.4', '< 6'
  spec.add_runtime_dependency 'activemodel', '~> 5.0', '>= 5.0.4', '< 6'
  spec.add_runtime_dependency 'savon', '~> 2.11', '>= 2.11.1'

  spec.add_development_dependency 'awesome_print', '~> 1.8'
  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'pry-byebug', '~> 3.4', '>= 3.4.2'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'rubocop', '~> 0.49.1'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.15', '>= 1.15.1'
  spec.add_development_dependency 'simplecov', '~> 0.14.1'
  spec.add_development_dependency 'vcr', '~> 3.0', '>= 3.0.3'
  spec.add_development_dependency 'webmock', '~> 3.0', '>= 3.0.1'
end
