namespace :ssl do
  desc 'Enable SSL for given Dokku app'
  task :enable, [:app] => :environment do |t, args|
    include Dokkustrano::Validations

    validate_app_argument!(args)

    sh "ssh -t #{Dokkustrano.configuration.host_name} 'dokku letsencrypt:enable #{args[:app]}'"
  end

  desc 'Auto-renew SSL for given Dokku app'
  task :renew, [:app] => :environment do |t, args|
    include Dokkustrano::Validations

    validate_app_argument!(args)

    sh "ssh -t #{Dokkustrano.configuration.host_name} 'dokku letsencrypt:auto-renew #{args[:app]}'"
  end

  desc 'Cleanup SSL for given Dokku app'
  task :cleanup, [:app] => :environment do |t, args|
    include Dokkustrano::Validations

    validate_app_argument!(args)

    sh "ssh -t #{Dokkustrano.configuration.host_name} 'dokku letsencrypt:cleanup #{args[:app]}'"
  end
end
