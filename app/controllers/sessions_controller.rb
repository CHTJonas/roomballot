class SessionsController < ApplicationController
  skip_before_action :check_user!

  def new
    redirect_to '/auth/ucamraven'
  end

  def create
    # Issue a new session identifier to protect against fixation
    reset_session
    auth = request.env["omniauth.auth"]
    # Find the user if they exist. Note that we don't create users - they
    # have to be explicitly authorised.
    user = User.find_by(crsid: auth['uid'])
    if user.nil?
      alert = { 'class' => 'danger', 'message' => 'You do not have an account on the Room Ballot system. Please contact the JCR Website Officer.' }
      flash.now[:alert] = alert
      render 'layouts/blank', locals: {reason: 'user auth successful but no account found'}, status: :forbidden and return
    end
    if user.blocked?
      alert = { 'class' => 'danger', 'message' => 'You have been temporarily blocked. Please try again later.' }
      flash.now[:alert] = alert
      render 'layouts/blank', locals: {reason: 'user blocked'}, status: :forbidden
    else
      # Save the user ID in the session so it can be used for subsequent requests.
      session[:user_id] = user.id
      alert = { 'class' => 'success', 'message' => 'You have successfully logged in.' }
      flash[:alert] = alert
      redirect_to root_url
    end
  end

  def destroy
    invalidate_session
    alert = { 'class' => 'success', 'message' => 'You have successfully logged out.' }
    flash.now[:alert] = alert
    render 'layouts/blank', locals: {reason: 'user logout'} and return
  end

  def failure
    alert = { 'class' => 'danger', 'message' => "Authentication error. Please contact support and quote the following error: #{params[:message].humanize}" }
    flash.now[:alert] = alert
    render 'layouts/blank', locals: {reason: 'login failure'}, status: :internal_server_error
  end

end
