require 'simplecov'
SimpleCov.start

require 'bank'
require 'rspec'

RSpec.describe 'bank.rb' do

  before :each do
    @add_account = Bank.new.add_account("euro",1000,1234)
    @withdraw = Bank.new.withdraw(1,6000,1234)
    @show_account = Bank.new.show_account(1,1234)
    @add_user = Bank.new.add_user("Jan","Kowalski")
    @add_user_account = Bank.new.add_user_account(0,0)
  end

  it 'should add new account' do
    expect{Bank.new.add_account("euro",1000,1234)}.not_to raise_error
  end

  it 'should add new user' do
    expect{Bank.new.add_user("Jan", "Kowalski")}.not_to raise_error
  end

end
