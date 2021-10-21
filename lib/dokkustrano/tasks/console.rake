desc 'Connect with Dokku app and open a Rails console'
task :console, [:app] => :environment do |t, args|
  include Dokkustrano::Validations

  validate_app_argument!(args)

  sh "ssh -t #{Dokkustrano.configuration.host_name} 'dokku run #{args[:app]} rails console -e production'"
end
