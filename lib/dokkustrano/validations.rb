module Dokkustrano
  module Validations
    def validate_argument!(args, argument, position = :first)
      return if args[argument].present?

      abort ":#{argument} argument missing (#{position} argument)"
    end

    def validate_app_argument!(args)
      validate_argument!(args, :app)
    end

    def validate_database_service_argument!(args)
      validate_argument!(args, :service)
    end

    def validate_version_argument!(args)
      validate_argument!(args, :version, :second)
    end

    def validate_path_argument!(args)
      validate_argument!(args, :path, :second)
    end
  end
end
