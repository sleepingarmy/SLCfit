class Contact < ApplicationMailer
  default :from => 'contact.slcfit@gmail.com'

  # send a signup email to the user, pass in the user object that contains the user's email address
  # def send_signup_email(user)
  #   @user = user
  #   mail( :to => @user.email,
  #   :subject => 'Welcome to SLCfit!' )
  # end

  def email_with_args_and_instance_vars(first_name, last_name)
    @username = username
    mail :to => "megan.slcfit@gmail.com",
         :subject => "Test Subject"
  end

end