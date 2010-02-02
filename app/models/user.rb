class User < ActiveRecord::Base
  acts_as_authentic
  #attr_accessible :username, :email, :password, :password_confirmation, :anonymous, :verified
  #attr_accessor :password
  
  validates_presence_of :username
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true


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

end
