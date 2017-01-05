require 'simplecov'
SimpleCov.start

require "menu"

RSpec.describe 'menu.rb' do

  it 'should not raise error' do
    expect{Menu.new.clear}.not_to raise_error
  end

end
