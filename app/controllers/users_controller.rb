class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_friendly_user, except: [:update, :index]

  def show
    @user = User.friendly.find(params[:id])
    @u = User.find(@user.following.ids)     # за кем следует текущий юзер
    #@folls = @user.followed.ids            # за кем следую я
  end

  def edit
  end
  
  def index
  end

  def update
    set_user
    if @user.update(user_params)
      redirect_to @user
    else
      flash.now[:alert] = 'Please try again'
      render :edit
    end
  end

  private

    def set_friendly_user
      @user = User.friendly.find(params[:id])
    end

    def set_user
      @user = User.find_by(id:current_user.id)
    end

    def user_params
      params.require(:user).permit(:username, :avatar)
    end
end
