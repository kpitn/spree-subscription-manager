class NewsletterMailer < ActionMailer::ARMailer
    self.delivery_method = :activerecord
  
   def send_newsletter(newsletter,user)
    @subject    =  newsletter.subject
    @body       =  newsletter.body
    @recipients = user.email
    @from       = Spree::Config[:order_from]
    @sent_on    = Time.now
  end

end
