lib = File.expand_path("../lib", __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'dokkustrano/version'

Gem::Specification.new do |gem|
  gem.name          = 'dokkustrano'
  gem.version       = Dokkustrano::VERSION
  gem.authors       = ['Lucas Hourquebie']
  gem.email         = ['lucas.hourquebie@unagi.com.ar']
  gem.description   = 'Dokkustrano is a utility and framework for executing commands via SSH on remote Dokku applications.'
  gem.summary       = 'Dokkustrano - Easy Dokku deployment with Ruby over SSH'
  gem.homepage      = 'https://github.com/unagisoftware/dokkustrano'
  gem.metadata      = {
    'bug_tracker_uri' => 'https://github.com/unagisoftware/dokkustrano/issues',
    'changelog_uri' => 'https://github.com/unagisoftware/dokkustrano/releases',
    'source_code_uri' => 'https://github.com/unagisoftware/dokkustrano',
    'homepage_uri' => 'https://github.com/unagisoftware/dokkustrano',
    'homepage' => 'https://github.com/unagisoftware/dokkustrano',
  }
  gem.files         = `git ls-files -z`.split("\x0").reject { |f| f =~ /^docs/ }
  gem.require_paths = ['lib']
  gem.licenses      = ['MIT']
  gem.required_ruby_version = '>= 2.0'
  gem.add_dependency 'rake', '>= 10.0.0'
end
