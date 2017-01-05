require 'simplecov'
SimpleCov.start

require 'bank'
require 'rspec'

RSpec.describe 'bank.rb' do

  before :each do
    @add_account = Bank.new.add_account("euro",1000,1234)
    @add_user = Bank.new.add_user("Jan","Kowalski")
    @read_file = Bank.new.read_file
    @withdraw = Bank.new.withdraw(1,6000,1234)

  end

    it 'method #add_account work?' do
      expect{Bank.new.add_account("euro",1000,1234)}.not_to raise_error
    end

    it 'method #add_user work?' do
      expect{Bank.new.add_user("Jan","Kowalski")}.not_to raise_error
    end

    it 'method #add_user_account work?' do
      expect{
        Bank.new.add_user_account(1,1)
      }.not_to raise_error
    end

    it 'method #add_money work?' do
      expect{
        Bank.new.add_money(1, "pln", 100, 1234)
      }.not_to raise_error
    end

    # it 'method #find_exchange_rate work?' do
    #   expect{Bank.new.find_exchange_rate("pln", "euro")}.not_to raise_error
    # end

  #   it 'method #read_file work?' do
  #     expect(@read_file).not_to raise_error
  #   end

    it 'method #withdraw work?' do
      expect{@withdraw}.not_to raise_error
    end

    it 'method #sprawdzPin work?' do
      expect{Bank.new.sprawdzPin(1,1234)}.not_to raise_error
    end

    it 'method #change_pin work?' do
      expect{Bank.new.change_pin(1,1234,1111)}.not_to raise_error
    end

    it 'method #edit_user edit?' do
      expect{Bank.new.edit_user(1, "Marian", "Kowalski")}.not_to raise_error
    end

    it 'method #show_all_account work?' do
      expect{Bank.new.show_all_account}.not_to raise_error
    end

    it 'method #delete_user delete?' do
      expect{Bank.new.delete_user(1)}.not_to raise_error
    end

    it 'method #delete_account delete?' do
      expect{Bank.new.delete_account(1,1234)}.not_to raise_error
    end

    it 'method #show_user work?' do
      expect{Bank.new.show_user(1)}.not_to raise_error
    end

    it 'method #show_account work?' do
      expect{Bank.new.show_account(1,1234)}.not_to raise_error
    end

    it 'method @find_users_in_currency' do
      expect{Bank.new.find_users_in_currency("pln")}.not_to raise_error
    end

    it 'method @find__currency' do
      expect{Bank.new.find_currency("pln")}.not_to raise_error
    end

end
