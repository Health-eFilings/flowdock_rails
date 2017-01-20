# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flowdock_rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'flowdock_rails'
  spec.version       = FlowdockRails::VERSION
  spec.authors       = ['Oscar Rocha']
  spec.email         = ['oscar_alan@hotmail.com']

  spec.summary       = 'Flowdock connection'
  spec.description   = 'Connect flowdock using source feature from Rails'
  spec.homepage      = 'https://github.com/aaroalan'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'faraday', '~> 0.9'
  spec.add_runtime_dependency 'faraday_middleware', '~> 0.10'
  spec.add_runtime_dependency 'activerecord', '>= 4.1.0'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'byebug', '~> 3.0'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'climate_control'
end
