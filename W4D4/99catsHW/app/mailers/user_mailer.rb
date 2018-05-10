class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io.'
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: user, subject: 'Welcome to My Awesome Site')
  end
end
