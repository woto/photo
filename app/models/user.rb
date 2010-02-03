class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.openid_required_fields = [:nickname, :email]
  end

  #attr_accessible :username, :email, :password, :password_confirmation, :anonymous, :verified
  #attr_accessor :password

  has_one :woto5s
  
  def identify!
    self.anonymous = false
    self.save
  end

  def verify!
    self.verified = true
    self.save
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end

  def deliver_password_reset_confirmation
    reset_perishable_token!
    Notifier.deliver_password_reset_confirmation(self)
  end

  def deliver_verification_instructions!
    reset_perishable_token!
    Notifier.deliver_verification_instructions(self)
  end

  def deliver_verification_confirmation!
    reset_perishable_token!
    Notifier.deliver_verification_confirmation(self)
  end

  private

  def map_openid_registration(registration)
    self.email = registration["email"] if email.blank?
    self.username = registration["nickname"] if username.blank?
  end

end
