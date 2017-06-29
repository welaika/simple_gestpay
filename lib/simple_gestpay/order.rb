# frozen_string_literal: true

module SimpleGestpay
  class Order
    include ActiveModel::Model

    attr_accessor :currency, :amount, :shop_transaction_id,
                  :buyer_name, :buyer_email, :language_name

    attr_reader :shop_login

    validates :currency, :amount, :shop_transaction_id, presence: true
    validates :language_name, inclusion: { in: LANGUAGE_CODES }
    validates :currency, inclusion: { in: CURRENCY_CODES }
    validates :amount, numericality: { greater_than: 0.0 },
                       format: { with: /\A\d+\.?\d{0,2}\z/ },
                       length: { maximum: 9 }
    validates :buyer_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
                            allow_blank: true
    validates :shop_transaction_id, length: { maximum: 50 }
    validates :buyer_name, :buyer_email, length: { maximum: 50 }, allow_blank: true

    def initialize(attributes = {})
      super
      config = SimpleGestpay.configuration
      @currency ||= config.default_currency
      @language_name ||= config.default_language
      @shop_login ||= config.shop_login
    end
  end
end
