require 'spec_helper'

describe "users/new" do
  before(:each) do
    @user = FactoryGirl.build(:user)
  end

  it "renders new user form" do
    render

    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_name", :name => @user.name
      assert_select "input#user_surname", :name => @user.surname
      assert_select "input#user_email", :name => @user.email
      assert_select "input#user_password", :name => @user.password
      assert_select "input#user_password_confirmation", :name => @user.password_confirmation
    end
  end
end
