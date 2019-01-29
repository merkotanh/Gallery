class FeedBackMailer < ActionMailer::Base

  def contact_me(message, email, username)
    @user_email = email
    @body = message.body
    @user_name = username
    mail to: ENV['EMAIL_LOGIN'], from: email
  end

  def contact_me_return(email, username)
  	@user_name = username
    mail to: email, from: ENV['EMAIL_LOGIN']
  end

end