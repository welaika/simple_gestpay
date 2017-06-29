# frozen_string_literal: true

module SimpleGestpay
  class EncryptResult
    attr_reader :soap_response

    def initialize(soap_response)
      @soap_response = soap_response
    end

    def success?
      content[:transaction_result] == 'OK'
    end

    def failure?
      !success?
    end

    def error_code
      content[:error_code]
    end

    def error_description
      content[:error_description]
    end

    def encrypted_string
      content[:crypt_decrypt_string]
    end

    private

    def content
      @content ||= begin
        soap_response.dig(
          :encrypt_response, :encrypt_result, :gest_pay_crypt_decrypt
        ).presence || {}
      end
    end

    def content?
      content.present?
    end
  end
end
