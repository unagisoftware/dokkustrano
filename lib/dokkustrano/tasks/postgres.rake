namespace :postgres do
  desc 'Connect with PostgreSQL console for given Dokku database service'
  task :console, [:service] => :environment do |t, args|
    include Dokkustrano::Validations

    validate_database_service_argument!(args)

    sh "ssh -t #{Dokkustrano.configuration.host_name} 'dokku postgres:connect #{args[:service]}'"
  end

  desc 'Change PostgreSQL version for given Dokku database service'
  task :change_version, [:service, :version] => :environment do |t, args|
    include Dokkustrano::Validations

    validate_database_service_argument!(args)
    validate_version_argument!(args)

    sh "ssh -t #{Dokkustrano.configuration.host_name} 'dokku postgres:stop #{args[:service]}'"
    sh "ssh -t #{Dokkustrano.configuration.host_name} 'dokku postgres:upgrade #{args[:service]} -I #{args[:version]}'"
    sh "ssh -t #{Dokkustrano.configuration.host_name} 'dokku postgres:start #{args[:service]}'"
  end
end
