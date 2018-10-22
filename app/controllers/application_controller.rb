class ApplicationController < ActionController::Base
  before_action :get_category_nav
  before_action :authenticate_user!, except: [:index, :show]

  private
  def get_category_nav
    @categoryNav = Category.all
  end
end
