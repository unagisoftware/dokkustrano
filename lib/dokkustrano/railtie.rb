require 'rails'
require 'dokkustrano/validations'

module Dokkustrano
  class Railtie < Rails::Railtie
    railtie_name :dokku

    rake_tasks do
      namespace :dokku do
        path = File.expand_path(__dir__)
        Dir.glob("#{path}/tasks/**/*.rake").each { |file| load file }
      end
    end
  end
end
