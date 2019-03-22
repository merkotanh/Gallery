class Users::RegistrationsController < Devise::RegistrationsController
  def create
    if verify_recaptcha
      super 
      begin
        MyMailer.welcome_email(current_user).deliver_now
      rescue
        # render html: "<script>alert('Could not send email!')</script>".html_safe
      end
    else
      redirect_to new_user_registration_path
    end
  end
end
