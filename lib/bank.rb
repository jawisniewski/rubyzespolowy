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

  def add_account(currency, balance, pin)
    id = @@accounts.size
    account = Account.new(id, currency, balance, pin)
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


  def add_money(id, currency, addBalance, pin)
    if(sprawdzPin(id, pin))
      if currency == @@accounts[id].currency
        addBalance = addBalance + @@accounts[id].balance
      else
        puts "Czy chcesz zrobic wymiany waluty wg stawki? (y,n)"
        wymiana = gets.chomp
        if wymiana=="y"
          addBalance = addBalance*find_exchange_rate(currency, @@accounts[id].currency) + @@accounts[id].balance
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

  def change_pin(id,pin,new_pin)
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
    @@accounts.each do |i|
       print  i.to_s

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
  end

  def show_account(id, pin)
     if(sprawdzPin(id,pin))
    print  @@accounts[id].to_s
    end
  end

    def find_users_in_currency(currency)
      value = "Uzytkownicy z kontem w walucie: " << currency << " \n"
        @@users.each do |i|
          i.accounts.each do |j|
          if j.currency == currency

            value << "Nazwisko: #{i.surname} "
            value << "Imie: #{i.name}" << " \n"
          end
        end
      end
      value
    end
    def find_currency(currency)
      value = "Konta w walucie: " << currency << " \n"
        @@accounts.each do |i|
          if i.currency == currency

            value << "id: #{i.id} "
            value << "ilosc pieniedzy: #{i.balance}"
          end
        end
      value
     end
  # 
  # Bank.new.add_account("eur",1000,1234)
  # Bank.new.add_account("pln",1000,1234)

end
