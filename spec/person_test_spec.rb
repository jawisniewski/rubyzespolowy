require_relative 'spec_helper'

RSpec.describe 'person.rb' do

  before :each do
    @person1 = Person.new :id, :name, :surname
    @account = Account.new(1,'pln',1111,1212)
    @add_account = Bank.new.add_account("euro",1000,1234)

  end

  describe "#new" do
    it 'method #new work?' do
      expect{Person.new(1, 'Jan', 'Kowalski')}.not_to raise_error
    end

    it "returns a account object" do
      expect(@person1).to be_an_instance_of(Person)
    end
  end

  describe "#id" do
    it "returns a correct id" do
      expect(@person1.id).to eq(:id)
    end
  end

  describe "#name" do
    it "returns a correct name" do
      expect(@person1.name).to eq(:name)
    end
  end

  describe "#surname" do
    it "returns a correct surname" do
      expect(@person1.surname).to eq(:surname)
    end
  end

  describe "#to_s" do
    it 'method #to_s work?' do
      expect{Person.new(1, 'Jan', 'Kowalski').to_s}.not_to raise_error
    end
  end

  describe "#add_account" do
    it 'method #add_account work?' do
      expect{@add_account}.not_to raise_error
    end
  end

end
