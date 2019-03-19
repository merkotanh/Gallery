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
      if !current_admin_user
        puts
        puts
        puts '???'*50
        puts current_admin_user
        @activity = ActivityLog.new
       
        if current_user
          @activity.user_id = current_user.id 
          @activity.action = current_user.email
        else
          @activity.user_id = 0 
          @activity.action = 'guest'
        end

        @activity.note =  "#{request.host}:#{request.port}#{request.fullpath}"
        @activity.browser = request.env['HTTP_USER_AGENT']
        @activity.ip_address = request.env['REMOTE_ADDR']
        @activity.controller = controller_name
        @activity.params = params
        @activity.save
      else
        puts
        puts
        puts '!!'*50
        puts
      end
    end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :birthday, :email, :password, :remember_me])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :birthday, :email, :password, :remember_me])
    end

end
