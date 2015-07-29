class UserMailer < ApplicationMailer
  default :from => 'megangrisley@gmail.com'

  # send a signup email to the user, pass in the user object that contains the user's email address
  def signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Welcome to SLCfit!' )
  end

end
