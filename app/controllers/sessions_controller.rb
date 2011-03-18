class SessionsController < ApplicationController
  def new
    @title = "Sign in"

    respond_to do |format|
      format.html
      format.js { render_to_facebox }
    end
  end

  def create
    user = User.authenticate(params[:session][:email],
                            params[:session][:password])
    respond_to do |format|
      if user.nil?
        format.html do
          flash.now[:error] = "Invalid email/password combination. Try again."
          @title = "Sign in"
          render 'new'
        end
        format.js do
          render :js => "$('#error-box').addClass('error');$('#error-box').text('Invalid email/password combination. Try again.');"
        end
      else
        sign_in user
        format.html do
          flash[:success] = "You have successfully signed in"
          redirect_back_or user
        end
        format.js do
        end
      end
    end
  end

  def destroy
    sign_out
    flash[:success] = "You have been signed out"
    redirect_to :back   
  end
end
