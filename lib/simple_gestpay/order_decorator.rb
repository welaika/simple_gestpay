# frozen_string_literal: true

module SimpleGestpay
  class OrderDecorator < SimpleDelegator
    def uic_code
      CURRENCY_CODES[currency]
    end

    def language_id
      LANGUAGE_CODES[language_name]
    end

    def shop_login
      SimpleGestpay.configuration.shop_login
    end

    def to_wsdl_message
      sanitize(
        shop_login: shop_login,
        uic_code: uic_code,
        amount: amount,
        shop_transaction_id: shop_transaction_id,
        language_id: language_id,
        buyer_name: buyer_name,
        buyer_email: buyer_email
      )
    end

    private

    def sanitize(message)
      message.reject { |_k, v| v.blank? }
    end
  end
end
