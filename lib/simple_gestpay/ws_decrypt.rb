# frozen_string_literal: true

module SimpleGestpay
  class WsDecrypt < ActiveInteraction::Base
    object :soap_client, class: WsCryptDecryptSoapClient,
                         default: -> { WsCryptDecryptSoapClient.new }
    string :crypted_string
    string :shop_login, default: -> { SimpleGestpay.configuration.shop_login }

    validates :soap_client, :shop_login, :crypted_string, presence: true

    def execute
      response = soap_client.call(:decrypt, message: message)
      DecryptResult.new(response.body)
    end

    private

    def message
      {
        shop_login: SimpleGestpay.configuration.shop_login,
        'CryptedString' => crypted_string
      }
    end
  end
end
