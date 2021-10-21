source "https://rubygems.org"

gemspec

# Latest versions of rake don't support Ruby < 2.2
if Gem::Requirement.new("< 2.2").satisfied_by?(Gem::Version.new(RUBY_VERSION))
  gem 'rake', '< 13.0.0'
end
