class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    #redirect_to account_url if current_user
    @user = User.new(params[:user])
    @user.save do |result|
      if result
        UserSession.create(@user, false)
        @user.deliver_verification_instructions!
        flash[:notice] = "Thank you for signing up! You are now logged in."
        redirect_to root_url
      else
        render :action => 'new'
      end
    end
  end

  def update
    debugger
    @user = current_user
    @user.attributes = params[:user]
    @user.save do |result|
      if result
        if @user.update_attributes(params[:user])
          @user.deliver_verification_instructions! unless @user.verified
          if @user.anonymous
            @user.identify!
            flash[:notice] = "Successfully registered"
          else
            flash[:notice] = "Successfully modified your account"
          end
          redirect_to root_url
        else
          render :action => 'edit'
        end
      end
    end
  end

end
