require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create new user' do
      @user = User.new(first_name: "Frank", last_name: "Sheffield", email: "123@gmail.com", password: "1234", password_confirmation: "1234")
      expect(@user).to be_present
    end

    it 'should require passwords to be present' do
      new_user = User.new(first_name: "Frank", last_name: "Sheffield", email: "123@gmail.com", password: nil, password_confirmation: nil)
      new_user.save
      expect(new_user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should require passwords to match' do
      new_user = User.new(first_name: "Frank", last_name: "Sheffield", email: "123@gmail.com", password: "1234", password_confirmation: "1")
      new_user.save
      expect(new_user.errors.full_messages).to include("Password confirmation doesn't match Password")
      new_user2 = User.new(first_name: "Frank", last_name: "Sheffield", email: "123@gmail.com", password: "1234", password_confirmation: "1234")
      new_user2.save
      expect(new_user2.errors.full_messages).to_not be_present
    end

    it 'should require email to be unique' do
      new_user = User.new(first_name: "Frank", last_name: "Sheffield", email: "123@gmail.com", password: "1234", password_confirmation: "1234")
      new_user.save
      new_user2 = User.new(first_name: "Lida", last_name: "Man", email: "123@gmail.com", password: "1234", password_confirmation: "1234")
      new_user2.save
      expect(new_user2.errors.full_messages).to include("Email has already been taken")
      new_user3 = User.new(first_name: "Lida", last_name: "Man", email: "123@GMAIL.COM", password: "1234", password_confirmation: "1234")
      new_user3.save
      expect(new_user3.errors.full_messages).to include("Email has already been taken")
    end


    it 'shoud require email to be present' do
      new_user = User.new(first_name: "Frank", last_name: "Sheffield", email: nil, password: "1234", password_confirmation: "1234")
      new_user.save
      expect(new_user.errors.full_messages).to include("Email can't be blank")
    end


    it 'shoud require first name to be present' do
      new_user = User.new(first_name: nil, last_name: "Sheffield", email: "123@gmail.com", password: "1234", password_confirmation: "1234")
      new_user.save
      expect(new_user.errors.full_messages).to include("First name can't be blank")
    end

    it 'shoud require last name to be present' do
      new_user = User.new(first_name: "Frank", last_name: nil, email: "123@gmail.com", password: "1234", password_confirmation: "1234")
      new_user.save
      expect(new_user.errors.full_messages).to include("Last name can't be blank")
    end


    it 'should require passwords to be at least 4 characters' do
      new_user = User.new(first_name: "Frank", last_name: "Sheffield", email: "123@gmail.com", password: "123", password_confirmation: "123")
      new_user.save
      expect(new_user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
      new_user2 = User.new(first_name: "Frank", last_name: "Sheffield", email: "123@gmail.com", password: "1234", password_confirmation: "1234")
      new_user2.save
      expect(new_user2.errors.full_messages).to_not be_present
    end
  
  end

  describe '.authenticate_with_credentials' do
    it 'authenticate should run' do
      new_user = User.new(first_name: "Frank", last_name: "Sheffield", email: "123@gmail.com", password: "1234", password_confirmation: "1234")
      new_user.save
      password = new_user.password_digest
      User.authenticate_with_credentials("123@gmail.com", password)
      expect(new_user.errors.full_messages).to_not be_present
    end

    it 'should sign in if there are spaces at beginning of email' do
      new_user = User.new(first_name: "Frank", last_name: "Sheffield", email: "123@gmail.com", password: "1234", password_confirmation: "1234")
      new_user.save
      password = new_user.password_digest
      User.authenticate_with_credentials("  123@gmail.com", password)
      expect(new_user.errors.full_messages).to_not be_present
    end


    it 'should sign in if email is incorrect case' do
      new_user = User.new(first_name: "Frank", last_name: "Sheffield", email: "123@gmail.com", password: "1234", password_confirmation: "1234")
      new_user.save
      password = new_user.password_digest
      User.authenticate_with_credentials("123@gMail.Com", password)
      expect(new_user.errors.full_messages).to_not be_present
    end

  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
