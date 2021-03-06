class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => [:destroy, :promote, :demote]
  before_filter :oneself, :only => [:destroy, :demote]
  before_filter :is_registered, :only => [:new, :create]

  def new
    @title = "Sign up"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if gotcha_valid? && @user.save
      sign_in @user
      flash[:success] = "Welcome to Alpha! You are now signed in"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def promote
    @user = User.find(params[:id])
    @user.update_attribute(:admin, true)
    flash[:success] = "Promoted to admin"
    redirect_to :back
  end

  def demote
    @user = User.find(params[:id])
    @user.update_attribute(:admin, false)
    flash[:success] = "User demoted"
    redirect_to :back
  end

  def index
    @users = User.where(['admin = ?', false])
    @admins = User.where(['admin = ?', true])
    @title = "All users"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless signed_in? && current_user.admin?
    end

    def oneself
      redirect_to(:back) && flash[:notice] = "Cant modify yourself" if User.find(params[:id]).id == current_user.id
    end

    def is_registered
      redirect_to(root_path) && flash[:notice] = "Already registered" if signed_in?
    end
end

