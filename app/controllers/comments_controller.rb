class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def show
  end

  def new
  end

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.create(comment_params)
  	@comment.user_id = current_user.id
    if @comment.save
      flash[:success] = t('comments.create.flash.success')
      record_activity("Adds a comment:")
    else
      flash[:error] = t('comments.create.flash.error')
    end
    redirect_back(fallback_location: root_path)
  end

  def edit
  end

  def destroy
    @image = Image.find(params[:image_id])
    @comment = @image.comments.find(params[:id])
    record_activity("Destroys a comment #{@comment.body}")
    @comment.destroy
    redirect_to image_path(@image)
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id, :image_id)
    end
end
