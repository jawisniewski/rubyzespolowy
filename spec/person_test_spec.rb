require 'simplecov'
SimpleCov.start

require 'person'

RSpec.describe 'person.rb' do

  before :each do
    @person1 = Person.new :id, :name, :surname
    @person2 = Person.new(0, 'Jan', 'Kowalski')
  end

  describe "#new" do
    it "should returns a account object" do
      expect(@person1).to be_an_instance_of(Person)
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

  describe "surname" do
    it "should returns a correct surname" do
      expect(@account.surname).to eq(:surname)
    end
  end

  # describe "test_init" do
  #   assert person2.to_s =~ /Jan Kowalski/
  # end

end
