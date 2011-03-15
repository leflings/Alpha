class UsersController < ApplicationController
  def new
    @title = "Sign up"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to Alpha!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @users = User.all
    @title = "All users"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
end
