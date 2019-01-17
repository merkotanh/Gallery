class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friendly_user, except: [:update, :index]

  def show
    @user = User.friendly.find(params[:id])
    @u = User.find(@user.following.ids)
    # qu = Resque.queue_from_class(SendEmailJob)
    # Resque.enqueue(SendEmailJob, 5)
    # Resque.enqueue(Sleeper)
  end

  def edit
  end
  
  def update
    if current_user.update(user_params)
      redirect_to current_user
    else
      flash.now[:alert] = 'Please try again'
      render :edit
    end
  end
  
  private

    def set_friendly_user
      @user = User.friendly.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :avatar)
    end
end
