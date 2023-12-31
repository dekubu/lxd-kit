# -*- encoding: utf-8 -*-
require File.expand_path('../lib/lxdkit/version', __FILE__)

Gem::Specification.new do |gem|

  gem.authors       = ["Delaney Burke"]
  gem.email         = ["delaney@zero2one.ee"]
  gem.summary       = %q{LXDKit makes it easy to write structured, testable lxc commands in Ruby}
  gem.description   = %q{A comprehensive toolkit for remotely running commands in a structured manner on groups of lxd containers.}
  gem.homepage      = "http://github.com/cococoder/lxdkit"
  gem.license       = "MIT"
  gem.metadata      = {
    "changelog_uri" => "https://github.com/cococoder/lxdkit/releases"
  }

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- test/*`.split("\n")
  gem.name          = "lxdkit"
  gem.require_paths = ["lib"]
  gem.version       = LXDKit::VERSION

  gem.add_runtime_dependency('net-ssh',  '>= 2.8.0')
  gem.add_runtime_dependency('net-scp',  '>= 1.1.2')

  gem.add_development_dependency('danger')
  gem.add_development_dependency('minitest', '>= 5.0.0')
  gem.add_development_dependency('minitest-reporters')
  gem.add_development_dependency('rainbow', '~> 2.2.2')
  gem.add_development_dependency('rake')
  gem.add_development_dependency('rubocop', "~> 0.49.1")
  gem.add_development_dependency('mocha')

  gem.add_development_dependency('bcrypt_pbkdf')
  gem.add_development_dependency('debug')
  gem.add_development_dependency('ed25519', '>= 1.2', '< 2.0')
end
