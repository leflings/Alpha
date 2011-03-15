class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],
                            params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination. Try again."
      @title = "Sign in"
      render 'new'
    else
      sign_in user
      flash[:success] = "You have successfuly signed in"
      redirect_to user
    end
  end

  def destroy
    sign_out
    flash[:success] = "You have been signed out"
    redirect_to root_path   
  end
end