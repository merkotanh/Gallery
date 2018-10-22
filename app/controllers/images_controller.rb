class ImagesController < ApplicationController
  def new
#    @image = Image.new
    @image = Category.images.build
  end

  def show
    @image = Image.find(params[:id])
  end

  def create
    @image = Category.images.new(image_params)
#    @image = Image.new(image_params)
#    @image = current_user.pins.build(image_params)
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

  private
    def image_params
      params.require(:image).permit(:image, :category_id, :image_title, :image_description, :image_file_size, :image_content_type, :remote_image_url)
    end
end
