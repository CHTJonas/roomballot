class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  before_action :check_user!
  before_action :set_raven_context if ENV['ENABLE_SENTRY'].present?
  helper_method :user_signed_in?
  helper_method :user_is_admin?

  # Recue exceptions raised due to cross-site request forgery
  rescue_from ActionController::InvalidAuthenticityToken do |exception|
    invalidate_session
    alert = { 'class' => 'danger', 'message' => "Cross-site request forgery detected! If you are seeing this message, try clearing your browser's cache/cookies and then try again." }
    flash.now[:alert] = alert
    render 'layouts/blank', locals: {reason: "CSRF detected: #{exception.message}"}, status: :forbidden
  end

  private

  # Finds the User with the ID that is stored in the session.
  # Logging in sets this session value and logging out removes it.
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue Exception => e
      nil
    end
  end

  # True if the user is signed in, false otherwise.
  def user_signed_in?
    return true if current_user
  end

  # True if the user is a site administrator, false otherwise.
  def user_is_admin?
    return user_signed_in? && current_user.admin?
  end

  # Method to ensure a logged in user is not blocked.
  def check_user!
    unless user_signed_in? && !current_user.blocked?
      alert = { 'class' => 'warning', 'message' => 'You must login to view this page.' }
      flash.now[:alert] = alert
      render 'layouts/blank', locals: {reason: 'user not authenticated'}, status: :forbidden
    end
  end

  # Method to simulate a user logoff.
  def invalidate_session
    # This removes the user_id session value
    @current_user = session[:user_id] = nil
  end

  def set_raven_context
    if Rails.env.production?
      Raven.user_context(id: current_user.try(:id), crsid: current_user.try(:uid), name: current_user.try(:name), email: current_user.try(:email))
      Raven.extra_context(params: params.to_unsafe_h, url: request.url)
    end
  end

end
