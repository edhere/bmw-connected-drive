# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bmw-connected-drive'

Gem::Specification.new do |s|
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-nc"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-remote"
  s.add_development_dependency "pry-nav"
  s.add_runtime_dependency('httparty', '~> 0.14.0', '>= 0.14.0')
  s.description   = "A ruby BMW connected drive API implementation"
  s.date          = Time.now.utc.strftime("%Y-%m-%d")
  s.name          = 'bmw-connected-drive'
  s.version       = BMWConnectedDrive::VERSION
  s.summary       = "A ruby BMW connected drive API implementation"
  s.authors       = ["Ed Richards"]
  s.email         = 'er@advect.us'
  s.require_paths = ["lib"]
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage      = 'http://www.github.com/advectus/bmw-connected-drive'
  s.license       = 'MIT'
end
