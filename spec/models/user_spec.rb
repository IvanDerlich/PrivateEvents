# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, :type => :model do
    
  fixtures :users

  it '#creates valid users from fixtures' do 
    expect(users(:pablo)).to be_valid
    expect(users(:ivan)).to be_valid
    expect(users(:gabriela)).to be_valid
  end   

  it 'is valid with name and email' do
    # user = User.new(name: 'John Doe', email: 'john@example.com')
    expect(users(:pablo)).to be_valid
  end

  it 'is invalid with email and name length more than 50' do
    name = "k" * 51
    user = User.new(name: name, email: "john@example.com")
    user.valid?
    expect(user.errors[:name]).to include("is too long (maximum is 50 characters)")
  end

  it 'is invalid with valid name and email length more than 255' do
    email = "k" * (256 - 11)
    user = User.new(name: "John Doe", email: email + "example.com")
    user.valid?
    expect(user.errors[:email]).to include("is too long (maximum is 255 characters)")
  end

  it 'is invalid without email' do
    user = User.new(name: "John")
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without name and valid email' do
    user = User.new(email: 'prueba@example.com')
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without name and email' do
    user = User.new
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
    expect(user.errors[:email]).to include("can't be blank")
  end

  context 'with differents invalid email addresses' do
    invalid_emails = [
      "plainaddress",
      "#@%^%#$@#$@#.com",
      "@example.com",
      "Joe Smith <email@example.com>",
      "email.example.com",
      "あいうえお@example.com",
      "email@example.com (Joe Smith)",
      "email@example",
      "email@111.222.333.44444",
      "email@example..com"
    ]

    it 'is invalid with valid name and invalid email formats' do
      user = User.new(name: "John Doe", email: nil)
      invalid_emails.each do |email|
        user.email = email
        expect(user).to_not be_valid
      end
    end
  end
end