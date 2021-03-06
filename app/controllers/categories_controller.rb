class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_category, only: [:show, :edit, :update, :destroy] 
  before_action :all_categories, only: [:index, :show, :edit]

  def index
  end

  def show
    @images = @category.images.order(created_at: :asc).page(params[:page]).per(25)
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
    
    if @category.save
      @image = @category.images.build
      flash[:success] = t('categories.create.flash.success')
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
      current_user.find_followers
      flash[:success] = t('categories.update.flash.success')
      redirect_to category_path(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    if @category.user.email == current_user.email
      @category.destroy
      flash[:notice] = t('categories.destroy.flash.notice')
    else
      flash[:alert] = t('categories.destroy.flash.error')
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
