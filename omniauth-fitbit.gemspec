lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'omniauth-fitbit/version'

Gem::Specification.new do |spec|
  spec.name    = 'omniauth-fitbit'
  spec.version = OmniAuth::Fitbit::VERSION
  spec.summary = "Omniauth strategy for FitBit."
  spec.authors = ["Victor Andrey"]
  spec.email   = 'victorvaot@gmail.com'

  spec.files   = `git ls-files -z`.split("\x0")
  spec.license = 'MIT'

  spec.add_runtime_dependency "omniauth-oauth2"
  spec.add_dependency 'multi_json', '~> 1.0'
end
