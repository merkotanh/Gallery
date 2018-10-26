class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_category_nav
  before_action :authenticate_user!, except: [:index, :show]

  private
  def get_category_nav
    @categoryNav = Category.all
  end
end
