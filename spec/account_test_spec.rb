require_relative 'spec_helper'

RSpec.describe 'account.rb' do

  before :each do
    @account1 = Account.new :id, :currency, :balance, :pin
  end

  describe "#new" do
    it "returns a account object" do
      expect(@account1).to be_an_instance_of(Account)
    end

    it "method #new works?" do
      expect{Account.new(1,'pln',1111,1212)}.not_to raise_error
    end
  end

  describe "#id" do
    it "returns a correct id" do
      expect(@account1.id).to eq(:id)
    end
  end

  describe "#currency" do
    it "returns a correct currency" do
      expect(@account1.currency).to eq(:currency)
    end
  end

  describe "#balance" do
    it "returns a correct balance" do
      expect(@account1.balance).to eq(:balance)
    end
  end

  describe "#pin" do
    it "returns a correct pin" do
      expect(@account1.pin).to eq(:pin)
    end
  end

  describe "#to_s" do
    it 'method #to_s work?' do
      expect{Account.new(1,'pln',1111,1212).to_s}.not_to raise_error
    end
  end

end
