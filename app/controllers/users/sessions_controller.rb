class Users::SessionsController < Devise::SessionsController
  def create
    if verify_recaptcha
      super 
    else
      redirect_to new_user_session_path
    end
  end

end
