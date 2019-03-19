class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :get_category_nav
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :record_activity

  private
    def set_locale
      I18n.locale = params[:locale || I18n.default_locale]
    end

    def default_url_options(options = {})
      { locale: I18n.locale }.merge options
    end

    def get_category_nav
      @categoryNav = Category.limit(5).order('id desc')
    end

    def record_activity(note = 'default')
      if current_admin_user
        user_id = current_admin_user.email
        user = 'Admin'
      else
        if current_user
          user_id = current_user.email
          user = current_user.username
        else
          user_id = 'guest'
          user = 'guest'          
        end
      end
      note =  "#{request.host}:#{request.port}#{request.fullpath}"
      browser = request.env['HTTP_USER_AGENT']
      ip_address = request.env['REMOTE_ADDR']
      # Activity.create!(user: current_user, action: note, url: request.original_url)
      ActivityLog.create!(user_id: user_id, user: user, note: note, browser: browser, ip_address: ip_address, controller:controller_name, action:action_name, params:params)
    end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :birthday, :email, :password, :remember_me])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :birthday, :email, :password, :remember_me])
    end

end
