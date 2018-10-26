class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @images = @category.images
  end

  def new
#    @category = Category.new
    @category = current_user.categories.build
  end

  def create
   @category = current_user.categories.build(category_params)
    if @category.save
      flash[:notice] = 'Category created'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.all
    @images = @category.images
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:notice] = 'Category updated'
      redirect_to category_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = 'Category removed'

    redirect_to images_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
