class Users::RegistrationsController < Devise::RegistrationsController
  def create
    if verify_recaptcha
      super 
      MyMailer.welcome_email(current_user).try.deliver_now
    else
      redirect_to new_user_registration_path
    end
  end
end
