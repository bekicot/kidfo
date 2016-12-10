class SitRequestMailer < ApplicationMailer
  def send_sitrequest(sitrequest)
    @sitrequest = sitrequest
    
    mail to: sitrequest.email, subject: "You've been invited to sit!"
  end
end
