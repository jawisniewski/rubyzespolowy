#require_relative 'person'
#require_relative 'bank'

  class Account

    attr_accessor :id, :currency, :balance, :pin

    def initialize(id, currency, balance, pin)
      @id = id
      @currency = currency
      @balance = balance
      @pin = pin
    end

    def to_s
      account = 'Stan konta: ' << @balance.to_s << "\n"
      account << 'Waluta konta: ' << @currency.to_s << "\n"
      account
    end

  end
