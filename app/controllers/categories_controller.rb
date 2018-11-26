class CategoriesController < ApplicationController

  before_action :find_category, only: [:show, :edit, :update, :destroy] 
  before_action :all_categories, only: [:index, :show, :edit]

  def index
  end

  def show
    @images = @category.images
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
    
    if @category.save
      @image = @category.images.build
      flash[:notice] = 'Category created'
      render 'images/new'
    else
      render 'new'
    end
  end

  def edit
    @images = @category.images
    render 'edit'
  end

  def update
    if @category.update(category_params)
      #@category.find_followers(current_user)
      current_user.find_followers(@category)
      flash[:notice] = 'Category updated'
      redirect_to category_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    if @category.user.email == current_user.email
      @category.destroy
      flash[:notice] = 'Category destroyed successfully'
    else
      flash[:notice] = "Only category's author has permission to delete the category"
    end

    redirect_to images_path
  end

  private

    def all_categories
      @categories = Category.all
    end

    def category_params
      params.require(:category).permit(:name)
    end

    def find_category
      @category = Category.find(params[:id])
    end
end
