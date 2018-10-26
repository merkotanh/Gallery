class ImagesController < ApplicationController
  before_action :find_image, only: [:show, :vote]
  before_action :authenticate_user!, only: [:create, :destroy, :show, :vote]
  respond_to :js, :json, :html

  def new
    @image = Image.new
#    @image = Category.images.build
  end

  def show
    @image = Image.find(params[:id])
   #@user = User.where(user_id: @) #@books = Book.where(author_id: @author.id)
   #@category = было бы неплохо найти юзера, который зааплоадил этот рис-к. для этого надо бы найти category_id, а потом и user_id
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = 'Image Created'
    redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = 'Image removed'

    redirect_to images_path
  end

  def index
    @images = Image.all
    @categories = Category.all
  end

  def vote
    if !current_user.liked? @image
      @image.liked_by current_user
    else 
      if current_user.liked? @image
        @image.unliked_by current_user
      end
    end
    #@image.upvote_by current_user
    redirect_to image_path    
  end

  private
    def image_params
      params.require(:image).permit(:image, :category_id, :image_title, :image_description, :image_file_size, :image_content_type, :remote_image_url)
    end

  def find_image
    @image = Image.find(params[:id])
  end
end
