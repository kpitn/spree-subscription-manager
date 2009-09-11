class NewsletterMailer < ActionMailer::Base
   self.delivery_method = :activerecord
  
   def send_newsletter(newsletter,user)
    @subject    =  newsletter.subject
    @body       =  {"newsletter" => newsletter}
    @recipients =  user.email
    @from       = "newsletter@fxmodelrc.com"
    @sent_on    = Time.now
    @content_type = "text/html"
    @headers["send_id"]=newsletter.id
    @headers["send_type"]="Newsletter"
  end

end
