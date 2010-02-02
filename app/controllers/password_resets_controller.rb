class PasswordResetsController < ApplicationController

  before_filter :load_user_using_perishable_token, :only => [:edit,:update]

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Instructions to reset your password have been sent to your email."
      redirect_to root_url
    else
      flash[:notice] = "No user was found with that email address"
      render 'new'
    end
  end

  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = "Password successfully updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private

  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    flash[:notice] = "Unable to find your account." unless @user
  end
end
