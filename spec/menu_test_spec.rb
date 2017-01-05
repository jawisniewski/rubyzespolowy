require 'simplecov'
SimpleCov.start

require "menu"

RSpec.describe 'menu.rb' do

  it 'method #Menu work?' do
    expect{Menu.new}.not_to raise_error
  end

  it 'method #authors_to_s work?' do
    expect{Menu.new.authors_to_s}.not_to raise_error
  end

  it 'method #to_s work?' do
    expect{Menu.new.to_s}.not_to raise_error
  end

  it 'method #clear work?' do
    expect{Menu.new.clear}.not_to raise_error
  end

end
