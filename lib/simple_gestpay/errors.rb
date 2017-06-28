# frozen_string_literal: true

module SimpleGestpay
  class Error < StandardError; end

  class MissingConfiguration < Error
    def message
      'Missing Configuration. Did you configure `SimpleGestpay`?'
    end
  end

  class InvalidConfiguration < Error
    attr_reader :configuration

    def initialize(configuration)
      super
      @configuration = configuration
    end

    def message
      errors = configuration.errors.full_messages.join(', ')
      "Configuration is not valid: #{errors}"
    end
  end
end
