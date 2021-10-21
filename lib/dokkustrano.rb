require 'dokkustrano/configuration'
require 'dokkustrano/railtie'

module Dokkustrano
  def self.configure
    @configuration ||= Configuration.new

    yield @configuration if block_given?
  end

  def self.configuration
    @configuration
  end

  configure
end
