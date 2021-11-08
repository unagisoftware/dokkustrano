desc 'Connect with Dokku app and open a Rails console'
task :console, [:app, :environment] => :environment do |t, args|
  include Dokkustrano::Validations

  validate_app_argument!(args)

  environment = args[:environment] || 'production'

  sh "ssh -t #{Dokkustrano.configuration.host_name} 'dokku run #{args[:app]} rails console -e #{environment}'"
end
