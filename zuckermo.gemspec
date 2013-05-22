# -*- encoding: utf-8 -*-
require File.expand_path('../lib/zuckermo/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "zuckermo"
  s.version     = Zuckermo::VERSION
  s.authors     = ["Jon Rowe"]
  s.email       = ["hello@jonrowe.co.uk"]
  s.homepage    = "https://github.com/JonRowe/zuckermo"
  s.summary     = "A RubyMotion Facebook Wrapper"
  s.description = "A RubyMotion Facebook Wrapper, based of @clayallsopp's TwitterMotion wrapper."

  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep(%r{^(spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "bubble-wrap", ">= 1.1.2"
  s.add_development_dependency 'rake'
  s.add_development_dependency 'dotenv'
end
