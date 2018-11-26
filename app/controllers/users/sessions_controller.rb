class Users::SessionsController < Devise::SessionsController
  #skip_before_action :authenticate_user!
  #prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  def new
    super 
    verify_recaptcha
  end

  def create
    super 
    verify_recaptcha
  end

  private

    # def check_captcha
    #   unless verify_recaptcha
    #     self.resource = resource_class.new sign_in_params
    #     resource.validate # Look for any other validation errors besides Recaptcha
    #     set_minimum_password_length
    #     respond_with resource
    #   end 
    # end

  # def check_captcha
  #   return if verify_recaptcha

  #   self.resource = resource_class.new sign_in_params
  #   resource.validate
  #   set_minimum_password_length
  #   respond_with resource
  # end

end
