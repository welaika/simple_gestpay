# frozen_string_literal: true

module SimpleGestpay
  class WsCrypt < ActiveInteraction::Base
    object :order, class: Order
    object :soap_client, class: WsCryptDecryptSoapClient,
                         default: -> { WsCryptDecryptSoapClient.new }

    validates :order, :soap_client, presence: true

    def execute
      response = soap_client.call(:encrypt, message: message)
      EncryptResult.new(response.body)
    end

    private

    def message
      OrderDecorator.new(order).to_wsdl_message
    end
  end
end
