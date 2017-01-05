require 'simplecov'
SimpleCov.start

require 'account'

RSpec.describe 'account.rb' do

  before :each do
    @account = Account.new :id, :name, :balance, :pin
  end

  describe "#new" do
    it "should returns a account object" do
      expect(@account).to be_an_instance_of(Account)
    end
  end

  describe "id" do
    it "should returns a correct id" do
      expect(@account.id).to eq(:id)
    end
  end

  describe "name" do
    it "should returns a correct name" do
      expect(@account.name).to eq(:name)
    end
  end

  describe "balance" do
    it "should returns a correct balance" do
      expect(@account.balance).to eq(:balance)
    end
  end

  describe "pin" do
    it "should returns a correct pin" do
      expect(@account.pin).to eq(:pin)
    end
  end

  # describe "to_s" do
  #   it "should returns a correct balance" do
  #     account = Account.new(100)
  #     assert_equal 100, account.balance
  #     assert account.to_s =~ /\100/
  #   end
  end


end
