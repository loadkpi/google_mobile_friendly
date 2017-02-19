# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_mobile_friendly/version'

Gem::Specification.new do |spec|
  spec.name          = "google_mobile_friendly"
  spec.version       = GoogleMobileFriendly::VERSION
  spec.authors       = ["Pavel Kozlov"]
  spec.email         = ["loadkpi@gmail.com"]

  spec.summary       = "Google Mobile-Friendly Test API wrapper for Ruby"
  spec.description   = "Ruby Wrapper for Mobile-Friendly Test from Google Search Console URL Testing Tools API"
  spec.homepage      = "https://github.com/loadkpi/google_mobile_friendly"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", '~> 1.7'
  spec.add_development_dependency "rspec", '~> 3.1'
  spec.add_development_dependency "webmock", '~> 2.0'
  spec.add_development_dependency "simplecov", '~> 0.10'
end
