require_relative 'person'
require_relative 'account'
require 'csv'
class Bank
  class << self
    attr_accessor :accounts
    attr_accessor :users
   end
   @@accounts = []
   @@users = []

  def add_account( name, balance, pin)
    id = @@accounts.size
    account = Account.new(id, name, balance, pin)
    @@accounts.push(account)
  end
    def add_user(name, surname)
      id = @@users.size
      user= Person.new(id,name,surname)
      @@users.push(user)
    end
    def add_user_account(account_id, person_id)
      @@users[person_id].add_account(@@accounts[account_id])
    end


  def add_money(id, name, addBalance, pin)
    if(sprawdzPin(id, pin))
      if name == @@accounts[id].name
        addBalance = addBalance + @@accounts[id].balance
      else
        puts "Czy chcesz zrobic wymiany waluty wg stawki? (y,n)"
        wymiana = gets.chomp
        if wymiana=="y"
          addBalance = addBalance*find_exchange_rate(name, @@accounts[id].name) + @@accounts[id].balance
        else
          addBalance = @@accounts[id].balance
        end
      end
      @@accounts[id].balance = addBalance
    end
  end
  def find_exchange_rate(first, secound)
    puts "#{first} #{secound}"
  read_file.find { |x| x['first'] == first && x['secound'] == secound }['exchange_rate'].to_f
  end
  def read_file
CSV.open(File.expand_path('../../exchange.csv', __FILE__),col_sep: ';',headers: true)
end
  def withdraw(id, withdrawMoney, pin)
    if(sprawdzPin(id, pin))
      withdrawMoney = @@accounts[id].balance-withdrawMoney
      if (withdrawMoney<0)
        print "Nie mozna wyplacic pieniedzy"
        print "\n"
      else
        @@accounts[id].balance = withdrawMoney
      end
    end
  end
  def sprawdzPin(id,pin)
    if(pin.to_i == @@accounts[id].pin)
      print  "Pin poprawny"
      print "\n"
      return true
    else
      print  "Pin bledny"
      print "\n"
      return false
    end
  end
  def change_pin(id, pin,new_pin)
      if(pin.to_i == @@accounts[id].pin)
        @@accounts[id].pin = new_pin
        puts "Nowy pin to #{@@accounts[id].pin}"
      end
  end
  def edit_user(id,name,surname)

        @@users[id].name = name
          @@users[id].surname = surname
        puts "Nowy dane to #{@@users[id].name} #{@@users[id].surname}"

  end
  def show_all_account
    @@users.each do |i|
       print  i.to_s
    #   print i.name
    #   print " "
    #   print i.surname
    #   print " \n  Konta: "
    #   i.accounts.each do |j|
    #
    #     print "\n    "
    #      print "typ: "
    #       print j.name
    #       print " Saldo: "
    #       print j.balance
    #       print " "
    # end
    #   print "\n"

    end

  end
  def delete_user(id)
      @@users.delete_at(id)
      @@users.each do |i|
        if i.id > id
          i.id = i.id - 1
        end
      end
    end
  def delete_account(id,pin)
    if sprawdzPin(id,pin)
      @@accounts.delete_at(id)

      @@accounts.each do |i|

        if i.id > id
          i.id = i.id - 1
        end
      end
      @@users.each do |i|
        licznik=0
        i.accounts.each do |j|

          if j.id == id
            i.delete_account(licznik)
          end
          licznik +=1
        end
      end
    end
  end
  def show_user(id)
  print  @@users[id].to_s
    # user = @@users[id]
    # print user.name
    # print user.surname
    # print "\n"
  end

  def show_account(id, pin)
     if(sprawdzPin(id,pin))
      # print @@accounts[id].name
      # print @@accounts[id].balance
      # print "\n"
    print  @@accounts[id].to_s
    end
  end
    # def showUserMoney(id, pin)
    #   if(sprawdzPin(id, pin))
    #
    #     print @@users[id].name
    #     print @@users[id].surname
    #     print " Konta: "
    #     @@users[id].accounts.each do |i|
    #     print  i.name
    #     print i.balance
    #     print " | "
    #     end
    #     print "\n"
    #   end
    # end
    def find_users_in_name(name)
      value = "Uzytkownicy z kontem w walucie: " << name << " \n"
        @@users.each do |i|
          i.accounts.each do |j|
          if j.name == name

            value << "Nazwisko: #{i.surname} "
            value << "imie: #{i.name}" << " \n"
          end
        end
      end
      value
    end
    def find_name(name)
      value = "Konta w walucie: " << name << " \n"
        @@accounts.each do |i|
          if i.name == name

            value << "id: #{i.id} "
            value << "ilosc pieniedzy: #{i.balance}"
          end
        end
      value
    end
  Bank.new.add_account("euro",1000,1234)
  Bank.new.add_account("pln",1000,1234)
  # Bank.new.addMoney(1, "pln",3000, 1234)
  #
  # Bank.new.addMoney(1,3000,1237)
  Bank.new.withdraw(1,6000,1234)
  Bank.new.show_account(1,1234)
  Bank.new.add_user("Jan","Kowalski")

  Bank.new.add_user("Janusz","Kowalski")
  Bank.new.add_user_account(1,1)
  Bank.new.add_user_account(0,0)
  # Bank.new.showAllAccount
#   Bank.new.showUser(1)
#   Bank.new.showUserMoney(1,1234)
#
#
# Bank.new.showUserMoney(0,1234)
end
