class AdminMailer < ActionMailer::Base
   default :from => "from@example.com"
  def admin_link(admin)
    @admin = admin
    mail(:to => @admin.email)
  end
  
  def send_password_reset_mail(admin)
    @admin = admin 
    mail(:to=> admin.email, :subject=> 'Password Reset')
  end 
end
