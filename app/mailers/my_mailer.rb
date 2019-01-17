class MyMailer < ApplicationMailer

  def welcome_email(user)
    @recipient = user.username
    mail(to: user.email, subject: "Welcome #{@recipient}")
  end

  def some_changes_in_follow(recipients)
    emails = recipients.collect(&:email).join(",")
    mail(to: emails, subject: "Category been changed")
  end
end
