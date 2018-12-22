class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :get_category_nav
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  #before_action :record_activity

  private
    def set_locale
      I18n.locale = params[:locale || I18n.default_locale]
    end

    def default_url_options(options = {})
      { locale: I18n.locale }.merge options
    end

    def get_category_nav
      @categoryNav = Category.all
    end

    def record_activity(note = 'default')
      @activity = ActivityLog.new
      @activity.user_id = current_user.id
      @activity.note =  "#{request.host}:#{request.port}#{request.fullpath}"
      @activity.browser = request.env['HTTP_USER_AGENT']
      @activity.ip_address = request.env['REMOTE_ADDR']
      @activity.controller = controller_name 
      @activity.action = current_user.email 
      @activity.params = params
      @activity.save
    end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :birthday, :email, :password, :remember_me])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :birthday, :about, :email, :password, :remember_me])
    end

end
