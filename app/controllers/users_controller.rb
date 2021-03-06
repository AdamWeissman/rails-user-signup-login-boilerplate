class UsersController < ApplicationController
  # This will place the "Home" and "Logout" links at the bottom of each page:
  layout "app_layout"
  # If you are already home then you will only see "Logout"
  # If you are already logged out you will only see "Home"
  # and is located here: app/views/layouts/app_layout.html.erb

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    if @user.valid?
      @user.save
      session[:user_id] = @user.id

      redirect_to root_path
    else
      render :new
    end

  end
end
