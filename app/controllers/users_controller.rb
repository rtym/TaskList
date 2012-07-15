class UsersController < ApplicationController
  before_filter :check_authentication, :except => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end

  def search
    if request.xhr?
      @users = User.search_user(params[:term]).map{|element| {:id => element.id, :value => %Q{#{element.name} #{element.surname}}}}

      render :json => @users
    end
  end
end
