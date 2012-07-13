require 'spec_helper'

describe UsersController do
  before(:each) do
    @user = FactoryGirl.build(:user)
  end

  def valid_attributes
    {:name => @user.name, :surname => @user.surname, :email => @user.email, :password => @user.password, :password_confirmation => @user.password_confirmation}
  end

  def valid_session
    {}
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      assigns(:user).should be_a_new(User)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "redirects to root_url" do
        #TODO
      end
    end

    describe "with invalid params" do
      it "do not creates a new User" do
        expect {
          post :create, {:user => {}}, valid_session
        }.to change(User, :count).by(0)
      end

      it "redirects to create new User" do
        #TODO
      end
    end
  end
end
