# Dokkustrano: A deployment tool built on Ruby, Rake, and SSH to connect with Dokku servers

Dokkustrano is a library for connecting with Dokku servers which run Ruby on Rails applications.

Once installed on a Rails project, Dokkustrano gives you rake tasks to perform several operations from your command line.

```
$ cd my-dokkustrano-enabled-rails-project
$ rails dokku:console[APP_NAME]
```

When you run [Rake](https://github.com/ruby/rake) tasks tasks from the `dokku` namespace, Dokkustrano dutifully connects to your server via SSH and executes the necessary actions.

## Installation

### Requirements

* Ruby version 2.0 or higher on your local machine.
* [Bundler](http://bundler.io), along with a Gemfile for your project.

### Setup

Add the gem to your project's Gemfile:

```ruby
gem 'dokkustrano'
```

Then run Bundler to ensure Dokkustrano is downloaded and installed:

``` sh
bundle install
```

Dokkustrano requires you to have configured a SHH host with the server in which Dokku will be running. By default, the host `dokku` will be used, but it can be changed using an initializer (`config/initializers/dokkustrano.rb`):

```ruby
require 'dokkustrano'

Dokkustrano.configure do |configuration|
  configuration.host_name = 'dokku-server'
end
```

## Available commands

These are all the Rake tasks which are provided by this gem:
```ruby
rails dokku:console[app]                                # Connect with Dokku app and open a Rails console
rails dokku:data:export[app]                            # Download dump from Dokku given app
rails dokku:data:import[app,path]                       # Import dump to given Dokku app
rails dokku:postgres:change_version[service,version]    # Change PostgreSQL version for given Dokku database service
rails dokku:postgres:console[service]                   # Connect with PostgreSQL console for given Dokku database service
rails dokku:ssl:cleanup[app]                            # Cleanup SSL for given Dokku app
rails dokku:ssl:enable[app]                             # Enable SSL for given Dokku app
rails dokku:ssl:renew[app]                              # Auto-renew SSL for given Dokku app
```

## Custom commands

You can define new actions yourself by writing Rake tasks, which are really simple to make. Here're some examples:

```ruby
namespace :dokku do
  desc 'Enter into container for given Dokku app'
  task :enter, [:app] => :environment do |t, args|
    include Dokkustrano::Validations

    validate_argument!(args, :app)

    sh "ssh -t #{Dokkustrano.configuration.host_name} 'dokku config:show #{args[:app]}'"
  end
end
```

```ruby
namespace :dokku do
  namespace :postgres do
    desc 'Restart PostgreSQL for given Dokku service'
    task :restart, [:service] => :environment do |t, args|
      include Dokkustrano::Validations

      validate_argument!(args, :service)

      sh "ssh -t #{Dokkustrano.configuration.host_name} 'dokku postgres:restart #{args[:service]}'"
    end
  end
end
```

As it can be seen in the previous examples, if you include the `Dokkustrano::Validations` module, you can use the `validate_argument!` method to validate arguments presence.

```ruby
validate_argument!(args, :app)
validate_argument!(args, :version, :second) # => indicates that the second argument is missing if that's the case
```

## Bugs report

Please, fill an issue with a reproduction of the error in order to report a bug.

If you think you may have discovered a security vulnerability in Dokkustrano, do not open a GitHub issue. Instead, please send a report to <info@unagi.com.ar>.

## License

MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
