class Notifier < ActionMailer::Base

  default_url_options[:host] = "authtrial.kevingisi.com"

  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    from          "AuthTrial Notifier <noreply@authtrial.kevingisi.com>"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end

  def verification_instructions(user)
    subject       "AuthTrial Email Verification"
    from          "AuthTrial Notifier <noreply@authtrial.kevingisi.com>"
    recipients    user.email
    sent_on       Time.now
    body          :verification_url => user_verification_url(user.perishable_token)
  end

end
