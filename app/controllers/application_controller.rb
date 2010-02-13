# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user, :current_user_session

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_any_user
    login_as_trial_user unless current_user
  end

  def require_registered_user
    unless current_user && !current_user.anonymous?
      store_location
      flash[:notice] = 'Вы должны быть залогинеными, чтобы получить доступ к этой странице'
      redirect_to login_url
      return false
    end
  end

  def require_no_user
    if current_user && !current_user.anonymous?
      store_location
      flash[:notice] = 'Вы должны быть не залогинеными, чтобы получить доступ к этой странице'
      redirect_to account_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def login_as_trial_user
    name = "anonymous_#{session[:session_id]}"
    UserSession.create(User.find_by_username(name) || User.create(:username => name, :password => name, :password_confirmation => name, :anonymous => true),false)
    @current_user_session = UserSession.find
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

end
