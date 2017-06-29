# frozen_string_literal: true

module SimpleGestpay
  module SoapClient
    DEFAULT_CONFIGURATION = {
      open_timeout: 5.seconds,
      read_timeout: 5.seconds,
      log: true,
      log_level: :debug,
      pretty_print_xml: true
    }.freeze

    def default_configuration
      config = DEFAULT_CONFIGURATION
      if SimpleGestpay.configuration.proxy.present?
        config[:proxy] = SimpleGestpay.configuration.proxy
      end
      config
    end
  end
end
