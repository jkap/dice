# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dice/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Josh Kaplan"]
  gem.email         = ["joshbrentkaplan@gmail.com"]
  gem.description   = %q{DICE! IT ROLLS!}
  gem.summary       = %q{2d10}
  gem.homepage      = "https://github.com/jkap/dice"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dice"
  gem.require_paths = ["lib"]
  gem.version       = Dice::VERSION
end
