# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord-pickin/version'

Gem::Specification.new do |gem|
  gem.name          = "activerecord-pickin"
  gem.version       = Activerecord::Pickin::VERSION
  gem.authors       = ["miio"]
  gem.email         = ["info@miio.info"]
  gem.description   = %q{INSERT SELECT Query For ActiveRecord}
  gem.summary       = %q{Can using INSERT SELECT}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency 'activerecord'
end
