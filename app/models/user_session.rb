class UserSession < Authlogic::Session::Base
  auto_register 

  def map_openid_registration(registration)
    debugger
  end

end
