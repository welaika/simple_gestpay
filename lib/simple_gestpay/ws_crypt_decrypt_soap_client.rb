# frozen_string_literal: true

module SimpleGestpay
  class WsCryptDecryptSoapClient
    include SoapClient

    delegate :call, to: :client

    WSDL_URL = {
      test: 'https://sandbox.gestpay.net/gestpay/GestPayWS/WsCryptDecrypt.asmx?wsdl',
      production: 'https://ecommS2S.sella.it/gestpay/GestPayWS/WsCryptDecrypt.asmx?wsdl'
    }.freeze

    attr_reader :client

    def initialize(configuration = {})
      options = configuration.reverse_merge(default_configuration.merge(wsdl: wsdl_url))
      @client = Savon.client(options)
    end

    private

    def wsdl_url
      WSDL_URL[SimpleGestpay.configuration.environment.to_sym]
    end
  end
end
