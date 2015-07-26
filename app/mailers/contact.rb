class Contact < ApplicationMailer
#   default :from => 'contact@devpointlabs.com'
#   include SendGrid

# # Plain Text Email
#   def send_contact_info
#     mail :to => "megangrisley@gmail.com", 
#          :subject => "Test Subject :-)",
#          :body => "This is the email body"
#   end


# # HTML Email
#   def send_contact_info_html
#     mail :to => "megangrisley@gmail.com",
#          :subject => "Test HTML Email Subject"
#   end

# # HTML Email with Args
#   def email_with_args(to_email, from_email, subject)
#     mail :to => to_email,
#          :from => from_email,
#          :subject => subject
#   end
# # HTML Email with Args and Instance Vars
#   def email_with_args_and_instance_vars(first_name, last_name)
#     @first_name = first_name
#     @last_name = last_name
#     mail :to => "megangrisley@gmail.com",
#          :subject => 'Test Subject'
#   end
end
