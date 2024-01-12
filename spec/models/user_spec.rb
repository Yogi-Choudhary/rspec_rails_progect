require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name and age' do
    user = User.new(name: "John", age: 25)
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(age: 25)
    expect(user).to_not be_valid
  end

  it 'is invalid without an age' do
    user = User.new(name: "John")
    expect(user).to_not be_valid
  end
end