class UserSessionsController < ApplicationController
  #before_filter :require_no_user, :only => [:new, :create]
  #before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    @user_session.save do |result|
      if result
        flash[:notice] = "Logged in successfully."
        #redirect_to_target_or_default(root_url)
        redirect_back_or_default root_url
      else
        flash.now[:error] = "Invalid login or password."
        render :action => 'new'
      end
    end
    i = 1
    #render :action => 'new'
  end
  
  def destroy
    #@user_session = UserSession.find
    #@user_session.destroy
    current_user_session.destroy
    flash[:notice] = "You have been logged out."
    #redirect_to root_url
    redirect_back_or_default new_user_session_url
  end
end
