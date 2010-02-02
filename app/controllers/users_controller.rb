class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    update and return if current_user
    @user = User.new(params[:user])
    if @user.save
      UserSession.create(@user, false)
      @user.deliver_verification_instructions!
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      @user.deliver_verfication_instructions! unless @user.verified
      if @user.anonymous
        @user.identify!
        flash[:notice] = "Successfully registered"
      else
        flash[:notice] = "Successfully modified your account"
      end
      redirect_to users_url
    else
      render :action => 'edit'
    end
  end

end
