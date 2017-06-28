# frozen_string_literal: true

module SimpleGestpay
  class Configuration
    include ActiveModel::Model

    SHOP_LOGIN_MAX_LENGTH = 30

    # This is your dealer code, eg: `GESPAY12345`
    attr_accessor :shop_login

    # Available values: [:test, :production]. Default to `:test`
    attr_accessor :environment

    # Default language. See `languages.rb` for available options. Default to Italian.
    attr_accessor :default_language

    # Default currency. See `currencies.rb` for available options. Default to Euro.
    attr_accessor :default_currency

    validates :shop_login, :environment, presence: true
    validates :environment, inclusion: { in: %i[test production] }
    validates :shop_login, length: { maximum: SHOP_LOGIN_MAX_LENGTH }
    validates :default_language, inclusion: { in: LANGUAGES }, allow_blank: true
    validates :default_currency, inclusion: { in: CURRENCIES }, allow_blank: true

    def initialize(attributes = {})
      super
      @environment ||= :test
      @default_language ||= 'it'
      @default_currency ||= 'EUR'
    end
  end

  def self.configuration
    raise MissingConfiguration if @configuration.blank?
    @configuration
  end

  def self.configuration=(config)
    raise InvalidConfiguration.new(config) unless config.valid?
    @configuration = config
  end

  def self.configure
    yield(@configuration ||= Configuration.new)
    raise InvalidConfiguration.new(@configuration) unless @configuration.valid?
  end
end
