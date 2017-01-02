require_relative 'person'
require_relative 'account'

class Bank
  class << self
    attr_accessor :accounts
    attr_accessor :users
   end
#    def initialize
#      @@accounts = []
# @@users = []
#    end
  @@accounts = Array.new
  @@users = Array.new
#Bank.accounts << Account.new(balance)
  #def self.open_account(person, balance=0)
#bank.accounts << Account.new(balance)
#  end
  # def addAccount(id, balance, pin, name, surname)
  #   account = Account.new(id, balance, pin)
  #   user = Person.new(id, name, surname)
  #   @@accounts.push(account)
  #   @@users.push(user)
  # end

  # def showAllAccount
  #   j = 0
  #   @@accounts.each do |i|
  #   #print i.id
  #     print @@users[j].name
  #     print @@users[j].surname
  #     print i.balance
  #     print "\n"
  #     j += 1
  #   end
  # end

  # def showAccount(id,pin)
  #   if sprawdzPin(id,pin)
  #     print @@accounts[id - 1].id
  #     print @@accounts[id - 1].balance
  #     print "\n"
  #   end
  # end

  # def addMoney(id, addBalance, pin)
  #   if sprawdzPin(id, pin)
  #     addBalance += @@accounts[id-1].balance
  #     @@accounts[id - 1] = Account.new(id, addBalance, pin)
  #   end
  # end
  #
  # def withdraw(id, withdrawMoney, pin)
  #   if sprawdzPin(id, pin)
  #     withdrawMoney = @@accounts[id - 1].balance - withdrawMoney
  #     if withdrawMoney < 0
  #       print "Nie mozna wyplacic pieniedzy"
  #       print "\n"
  #     else
  #       @@accounts[id - 1].balance = withdrawMoney
  #     end
  #   end
  # end

  # def showUser(id)
  #   user = @@users[id - 1]
  #   print user.name
  #   print user.surname
  #   print "\n"
  # end
#def addUser(id, name, surname)
#  user= Person.new(id,name,surname)
 #@@users.push(user)
#end
  #
  # def showUserMoney(id, pin)
  #   if sprawdzPin(id, pin)
  #     user = @@users[id - 1]
  #     print user.name
  #     print user.surname
  #     print @@accounts[id - 1].balance
  #     print "\n"
  #   end
  # # end
  # def sprawdzPin(id, pin)
  #   if pin == @@accounts[id - 1].pin
  #     print  "Pin poprawny"
  #     print "\n"
  #     return true
  #   else
  #     print  "Pin bledny"
  #     print "\n"
  #     return false
  #   end
  # end
Bank.new.addAccount(1,1000,1234,"Jan","Arbuz")
Bank.new.addAccount(2,1000,1234,"Jan","Kowalski")
Bank.new.addMoney(1,3000,1234)

Bank.new.addMoney(1,3000,1237)
Bank.new.withdraw(1,6000,1234)
Bank.new.showAccount(1,1234)
#Bank.new.addUser(1,"Jan","Kowalski")

#Bank.new.addUser(2,"Janusz","Kowalski")

Bank.new.showAllAccount
Bank.new.showUser(1)
Bank.new.showUserMoney(1,1234)

Bank.new.showUserMoney(1,123)
end
