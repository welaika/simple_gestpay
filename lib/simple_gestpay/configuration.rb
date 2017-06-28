# frozen_string_literal: true

module SimpleGestpay
  class Configuration
    # This is your dealer code, eg: `GESPAY12345`
    attr_accessor :shop_login

    # Available values: [:test, :production]. Default to `:test`
    attr_accessor :environment

    # WSDL URI for test environment
    attr_reader :test_wsdl_url

    # WSDL URI for production environment
    attr_reader :production_wsdl_url

    def initialize
      @environment = :test
      @test_wsdl_url = 'https://testecomm.sella.it/gestpay/GestPayWS/WsCryptDecrypt.asmx?wsdl'
      @production_wsdl_url = 'https://ecommS2S.sella.it/gestpay/GestPayWS/WsCryptDecrypt.asmx?wsdl'
    end

    def wsdl_uri
      if production_env?
        production_wsdl_url
      else
        test_wsdl_url
      end
    end

    def production_env?
      environment == :production
    end

    def test_env?
      !production_env?
    end
  end

  def self.configuration
    @configuration ||= ::SimpleGestpay::Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configure
    yield configuration
  end
end
