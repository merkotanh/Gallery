class MyMailer < ApplicationMailer

  def welcome_email
    user_to = params[:user]
    @url  = 'http://example.com/login'
    mail(to: user_to.email, subject: 'Welcome to My Awesome Site')
  end

  def some_changes_in_follow(recipients)
    # recipients.each do |recipient|
    #   mail(
    #     to: recipient.email, 
    #     subject: "New comment on the Subvisual blog"
    #   )
    # end

    emails = recipients.collect(&:email).join(",")
    mail(:to => emails, :subject => "Hii")

  end
end
