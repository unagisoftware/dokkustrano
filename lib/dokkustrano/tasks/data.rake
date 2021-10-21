namespace :data do
  desc 'Download dump from Dokku given app'
  task :export, [:app] => :environment do |t, args|
    include Dokkustrano::Validations

    validate_app_argument!(args)

    sh "ssh -t #{Dokkustrano.configuration.host_name} 'dokku postgres:export #{args[:app]}' > dump.sql"
    puts "Dump exported to 'dump.sql'"
  end

  desc 'Import dump to given Dokku app'
  task :import, [:app, :path] => :environment do |t, args|
    include Dokkustrano::Validations

    validate_app_argument!(args)
    validate_path_argument!(args)

    sh "scp #{args[:path]} #{Dokkustrano.configuration.host_name}:/tmp/dump.sql"
    sh "ssh -t #{Dokkustrano.configuration.host_name} 'dokku postgres:import #{args[:app]} < /tmp/dump.sql'"
  end
end
