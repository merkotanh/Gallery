class Users::RegistrationsController < Devise::RegistrationsController
  def create
    if verify_recaptcha
      super 
    else
      redirect_to new_user_registration_path
    end
  end
end
