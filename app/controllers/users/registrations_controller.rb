class Users::RegistrationsController < Devise::RegistrationsController
  def create
    if verify_recaptcha
      MyMailer.welcome_email(current_user).deliver_now
      super 
    else
      redirect_to new_user_registration_path
    end
  end
end
