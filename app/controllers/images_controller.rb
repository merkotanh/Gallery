class ImagesController < ApplicationController
  before_action :find_image, only: [:show, :edit, :update, :destroy, :vote]
  before_action :authenticate_user!, only: [:create, :destroy, :show, :vote]
  after_action :mail_to_user, only: [:create, :update, :destroy]
  respond_to :js, :json, :html

  def index
    @images = Image.order(created_at: :desc).page(params[:page]).per(35)
    @categories = Category.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
    
    if @image.save
      flash[:success] = 'Image Created'
      redirect_back(fallback_location: root_path)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @image.update(image_params)
      flash[:success] = 'Image updated'
    else
      flash[:alert] = 'Image could not be updated'
    end
    redirect_to image_path
  end
 
  def destroy
    if @image.category.user.id == current_user.id
      @image.destroy
      flash[:notice] = 'Image deleted'      
    else
      flash[:alert] = "Only picture's author could delete the picture"
    end
    redirect_to root_path
  end

  def vote
    record_activity('Likes a picture')
    
    if !current_user.liked? @image
      @image.liked_by current_user
    else 
      if current_user.liked? @image
        @image.unliked_by current_user
      end
    end
  end

  private
    def image_params
      params.require(:image).permit(:image, :category_id, :image_title, :image_description, :image_file_size, :image_content_type, :remote_image_url)
    end

    def find_image
      @image = Image.find(params[:id])
    end

    def mail_to_user
      current_user.find_followers
    end
end
