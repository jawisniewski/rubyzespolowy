#Account class
class Account
  attr_accessor :id, :name, :balance, :pin, :person
  def initialize(id, name, balance, pin, person)
    @id = id
    @name = name
    @balance = balance
    @pin = pin
    @person = person
  end

  def add_account(id, balance, pin, person)
    account = Account.new(id, balance, pin, person)
    @@accounts.push(account)
  end

  def addMoney(id, addBalance, pin)
    if sprawdzPin(id, pin)
      addBalance += @@accounts[id-1].balance
      @@accounts[id - 1] = Account.new(id, addBalance, pin)
    end
  end

  def withdraw(id, withdrawMoney, pin)
    if sprawdzPin(id, pin)
      withdrawMoney = @@accounts[id - 1].balance - withdrawMoney
      if withdrawMoney < 0
        print "Nie mozna wyplacic pieniedzy"
        print "\n"
      else
        @@accounts[id - 1].balance = withdrawMoney
      end
    end
  end

  def to_s(account, person)
    account = 'Nazwisko :' << person.surname.to_s
    account << " imie: "<< person.name.to_s << "\n"
    account << 'Stan konta :' << account.balance.to_s << "\n"
  end
end


def sprawdzPin(id, pin)
  if pin == @@accounts[id - 1].pin
    print  "Pin poprawny"
    print "\n"
    return true
  else
    print  "Pin bledny"
    print "\n"
    return false
  end
end
# account1 = new.Account 1, 1000
#  p account1
