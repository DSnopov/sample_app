class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user.try(:authenticate, params[:session][:password])
      if user.activated?
        log_in user
        redirect_to user
      else
        flash[:warning] = 'Account not activated. Check your email for the activation link.'
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
