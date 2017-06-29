# frozen_string_literal: true

module SimpleGestpay
  class DecryptResult
    attr_reader :soap_response

    def initialize(soap_response)
      @soap_response = soap_response
    end

    def success?
      content[:transaction_result] == 'OK'
    end

    def pending?
      content[:transaction_result] == 'XX'
    end

    def failure?
      content[:transaction_result] == 'KO'
    end

    def shop_transaction_id
      content[:shop_transaction_id]
    end

    def bank_transaction_id
      content[:bank_transaction_id]
    end

    def authorization_code
      content[:authorization_code]
    end

    def currency_id
      content[:currency]
    end

    def currency
      CURRENCY_CODES.invert[currency_id]
    end

    def amount
      content[:amount].to_d
    end

    def error_code
      content[:error_code]
    end

    def error_description
      content[:error_description]
    end

    private

    def content
      @content ||= begin
        soap_response.dig(
          :decrypt_response, :decrypt_result, :gest_pay_crypt_decrypt
        ).presence || {}
      end
    end

    def content?
      content.present?
    end
  end
end
