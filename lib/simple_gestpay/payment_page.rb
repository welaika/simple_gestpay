# frozen_string_literal: true

module SimpleGestpay
  class PaymentPage
    URL_FORMAT = {
      'test' =>
        'https://testecomm.sella.it/pagam/pagam.aspx?a=%{shop_login}&b=%{encrypted_string}',
      'production' =>
        'https://ecomm.sella.it/pagam/pagam.aspx?a=%{shop_login}&b=%{encrypted_string}'
    }.freeze

    attr_reader :shop_login, :environment, :encrypted_string

    def initialize(shop_login: SimpleGestpay.configuration.shop_login,
                   environment: SimpleGestpay.configuration.environment,
                   encrypted_string:)
      @shop_login = shop_login
      @encrypted_string = encrypted_string
      @environment = environment
    end

    def url
      format(URL_FORMAT.fetch(environment),
             shop_login: shop_login, encrypted_string: encrypted_string)
    end
  end
end
