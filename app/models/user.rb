class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.openid_required_fields = [:email, :nickname, "http://axschema.org/namePerson/friendly", "http://axschema.org/contact/email"]
    c.login_field = "username"
    #c.openid_optional_fields = [:timezone, "http://axschema.org/pref/timezone"]

  end

  #attr_accessible :username, :email, :password, :password_confirmation, :anonymous, :verified
  #attr_accessor :password

  has_one :woto5
  has_many :images
  has_many :photos
  has_many :orders
  
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

  #private
  #
  #def map_openid_registration(registration)
  #  self.email = registration["email"] if email.blank?
  #  self.username = registration["nickname"] if username.blank?
  #end

  private

  def map_openid_registration(registration)
    debugger
    if registration.empty?
      # no email returned
      self.username_autoset = false
      self.email_autoset = false
    else

      # nickname by sreg
      unless registration["nickname"].nil? && registration["nickname"].blank?
        self.username = registration["nickname"]
        self.username_autoset = true
      else
      # nickname by ax
        unless registration['http://axschema.org/namePerson/friendly'].nil?
          self.username_autoset = true
          #self.username = ...
          raise Exception
        else
          self.username_autoset = false
        end
      end

      # email by sreg
      unless registration["email"].nil? && registration["email"].blank?
        self.email = registration["email"]
        self.email_autoset = true
      else
        # email by ax
        unless registration['http://axschema.org/contact/email'].nil? && registration['http://axschema.org/contact/email'].first.blank?
          self.email = registration['http://axschema.org/contact/email'].first
          self.email_autoset = true
        else
          # registration-hash seems to contain information other than the email-address
          self.email_autoset = false
        end
      end
    end
  end

  def self.find_by_openid_identifier(identifier)
    u = User.first(:conditions => { :openid_identifier => identifier })
    u ||= User.create(:openid_identifier => identifier)
    u
  end

end
