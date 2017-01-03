#!/usr/bin/env ruby
require_relative '../lib/menu.rb'
 require_relative '../lib/person.rb'
 require_relative '../lib/account.rb'
#
 require_relative '../lib/bank.rb'
class Run
# @manager = Manager.new
  @menu = Menu.new
  @bank = Bank.new
  while true
    system "cls"
    puts @menu.to_s
    case gets.chomp
    when '1'
      puts @menu.account.to_s
      case gets.chomp
      when '1'
        @menu.clear
        puts "Pokaz wszystkie konta\n"
        @bank.show_all_account
      when '2'
          @menu.clear
        puts "Szukaj konto \n"
        puts "Podaj id szukanego konta"
        id = gets.chomp
        puts "Podaj pin"
        pin= gets.chomp
        id = Integer(id)
        pin = Integer(pin)

        @bank.show_account(id,pin)
      when '3'
        puts " Dodaj konto \n"
        puts "Podaj walute \n"
        name = gets.chomp
        puts "Podaj pin\n"
        pin = gets.chomp
      pin =  Integer(pin)
        @bank.add_account(name, 0, pin)
        puts " Dodano konto\n"
      when '4'
        puts "Zmień pin do konta \n"
        puts "Podaj id konta"
        id = gets.chomp
        puts "Podaj stary pin"
        pin = gets.chomp
        puts "podaj nowy pin"
        new_pin = gets.chomp
        @bank.change_pin(id.to_i, pin.to_i, new_pin.to_i)

      when '5'
        puts "Usuń konto \n"
        puts "Podaj id konta"
        id = gets.chomp
        puts "Podaj pin"
        pin = gets.chomp
        @bank.delete_account(id.to_i, pin.to_i)
      when '6'
        puts " Pokaz konta wedlug waluty\n"
        puts "Podaj typ waluty \n"
        name = gets.chomp
        puts @bank.find_name(name)
      else
        puts "Zly wybor\n"
      end
    when '2'
      puts @menu.users.to_s
      case gets.chomp
      when '1'
        puts "wyswietl uzytkownikow"
          @bank.show_all_account
      when '2'
        puts "Szukaj uzytkownika \n"
        @menu.clear
      puts "Szukaj uzytkownika \n"
      puts "Podaj id szukanego uzytkownika"
      id = gets.chomp
      id = Integer(id)

      @bank.show_user(id)
    when '3'
        puts " Dodaj uzytkownika \n"
        puts "Podaj imie \n"
        name = gets.chomp
        puts "Podaj nazwisko\n"
        surname = gets.chomp

        @bank.add_user(name, surname)
        puts " Dodano uzytkownika\n"
      when '4'
        puts "Edytuj dane uzytkownika\n"
        puts "Podaj id \n"
        id = gets.chomp
        puts "Podaj imie \n"
        name = gets.chomp
        puts "Podaj nazwisko\n"
        surname = gets.chomp

        @bank.edit_user(id.to_i, name, surname)
        puts " Dodano uzytkownika\n"
      when '5'
        puts "Usuń uzytkownika \n"
        puts "Podaj id uzytkownika"
        id = gets.chomp
        @bank.delete_user(id.to_i)
      when '6'
        puts " Pokaz uzytkownikow wedlug waluty kont\n"
        puts "Podaj typ waluty \n"
        name = gets.chomp
        puts @bank.find_users_in_name(name)
      else
        puts " Zly wybor\n"
      end
    when '3'
      puts "Polacz konta z uzytkownikem\n"
      puts "Podaj id uzytkownika\n"
      id = gets.chomp
      id = Integer(id)
      puts "Podaj id konta\n"
      id_account = gets.chomp
      id_account = Integer(id_account)
      @bank.add_user_account(id, id_account)
      puts " Dodano konto\n"

    when '4'
      puts "Wplac pieniedze na konta\n"
      puts "Podaj id konta\n"
      id = gets.chomp
      id = Integer(id)

      puts "Podaj pin\n"
      pin = gets.chomp
      pin= Integer(pin)
      puts "Podaj walute\n"
      name = gets.chomp
      puts "Podaj kwote"
      balance = gets.chomp
      balance = balance.to_f
      @bank.add_money(id, name, balance, pin)
      puts " Wplacono pieniadze\n"
    when '5'
      puts "Wyplac pieniedze z konta\n"
      puts "podaj id konta"
      id = gets.chomp
      id = Integer(id)

            puts "Podaj pin\n"
            pin = gets.chomp
            pin= Integer(pin)

            puts "Podaj kwote"
            balance = gets.chomp
            balance = balance.to_f
            @bank.withdraw(id,balance,pin)
    when '6'
      puts @menu.authors


    when 'q'
      break
    else
      puts 'Podales zly znak'
    end
  end
end
