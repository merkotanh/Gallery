class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params
  if @message.valid?
      FeedBackMailer.contact_me(@message, current_user.email, current_user.username).deliver_now
      FeedBackMailer.contact_me_return(current_user.email, current_user.username).deliver_now
      flash[:notice] = t('messages.create.flash.notice')
    else
      flash[:error] = t('messages.create.flash.error')
    end
    redirect_to new_message_url
  end

  private
    def message_params
      params.require(:message).permit(:body)
    end
end
