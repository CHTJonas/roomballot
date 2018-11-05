class SessionsController < ApplicationController

  def new
    redirect_to '/auth/ucamraven'
  end

  def create
    auth = request.env["omniauth.auth"]
    # Find the user if they exist or create if they don't.
    user = User.find_by(provider: auth['provider'], uid: auth['uid'].to_s) || User.create_with_omniauth(auth)
    if user.blocked?
      user = nil
      render plain: "User blocked"
    else
      session[:user_id] = user.id
      render plain: "Logged in: #{auth.inspect}"
    end
  end

  def destroy
    if user_signed_in?
      invalidate_session
      render plain: "Logged out"
    end
  end

  def failure
    render plain: "Error: #{params[:message].humanize}"
  end

end
