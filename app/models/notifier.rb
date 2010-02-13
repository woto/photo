class Notifier < ActionMailer::Base

  def password_reset_instructions(user)
    subject       "Инструкции по смене пароля"
    from          "noreply <noreply@woto-netbook>"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end

  def verification_instructions(user)
    subject       "Подтверждение пароля"
    from          "noreply <noreply@woto-netbook>"
    recipients    user.email
    sent_on       Time.now
    body          :verification_url => user_verification_url(user.perishable_token)
  end

end
