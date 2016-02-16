# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'debarasser'

Gem::Specification.new do |spec|
  spec.name          = Debarasser::PRODUCT
  spec.version       = Debarasser::VERSION
  spec.authors       = ["dkhamsing"]
  spec.email         = ["dkhamsing8@gmail.com"]

  spec.summary       = 'Cleanup your GitHub forks'
  spec.description   = 'Cleanup your GitHub forks'
  spec.homepage      = 'https://github.com/dkhamsing/debarasser'

  spec.bindir        = 'bin'
  spec.executables   = [Debarasser::PRODUCT]
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'octokit', '~> 4.2.0' #github
end
