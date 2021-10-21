module Dokkustrano
  class Configuration
    DEFAULT_HOST_NAME = 'dokku'.freeze

    attr_writer :host_name

    def host_name
      @host_name || DEFAULT_HOST_NAME
    end
  end
end
