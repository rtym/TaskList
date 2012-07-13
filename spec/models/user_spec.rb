require 'spec_helper'

describe User do
  it "should create a new instance of a user given valid attributes" do
    FactoryGirl.create(:user)
  end

  describe "associations" do
    it "should have many tasks" do
      should have_many(:tasks)
    end
  end

  describe "validations" do
    it "should validate presence" do
      should validate_presence_of :name
      should validate_presence_of :surname
      should validate_presence_of :email
      should validate_presence_of :password
    end

    it "should prevent creating duplicates" do
      FactoryGirl.create(:user)

      FactoryGirl.build(:user).should_not be_valid
    end

    it "should be invalid without incorrect email" do
      should_not allow_value("test").for(:email)
      should_not allow_value("test@test").for(:email)
      should_not allow_value("@test").for(:email)
      should_not allow_value("1@test").for(:email)
    end
  end

  describe "authentication" do
    it "should generate password salt and hash" do
      user = FactoryGirl.build(:user)

      user.encrypt_password

      user.password_salt.should_not be_nil
      user.password_hash.should_not be_nil
    end

    it "should generate password salt and password hash with specified length" do
      user = FactoryGirl.build(:user)

      user.encrypt_password

      user.password_salt.should have(29).characters
      user.password_hash.should have(60).characters
    end

    it "should not authenticate" do
      user = FactoryGirl.create(:user)

      User.authenticate(user.email, user.password).should_not be_nil
    end

    it "should not authenticate with incorrect password" do
      user = FactoryGirl.create(:user)

      User.authenticate(user.email, "dummy").should be_nil
    end
  end

  describe "methods" do
    it "should generate full name" do
      user = FactoryGirl.create(:user)

      user.full_name.should eq(user.name + ' ' + user.surname)
    end
  end
end
