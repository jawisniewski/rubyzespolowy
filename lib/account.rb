#require_relative 'person'
#require_relative 'bank'

  class Account

    attr_accessor :id, :name, :balance, :pin

    def initialize(id, name, balance, pin)
      @id = id
      @name = name
      @balance = balance
      @pin = pin
    end

    def to_s
      # account = 'Nazwisko :' << person.surname.to_s
      # account << " imie : " << person.name.to_s << "\n"

      account = 'Stan konta :' << @balance.to_s << "\n"
      account << 'nazwa konta: ' << @name.to_s << "\n"
      account
    end

  end

#account1 = new.Account 1, 1000
#  p account1
