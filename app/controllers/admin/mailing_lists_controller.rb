class Admin::MailingListsController <  Admin::BaseController
  resource_controller
  
  create.response do |wants|
    wants.html { redirect_to admin_mailing_lists_path }
  end
  
  update.response do |wants|
    wants.html { redirect_to admin_mailing_lists_path }
  end
  
  show.response do |wants|
    wants.html { render :text => @mailing_list.users.collect(&:email).join(", ")+","+@mailing_list.subscriptions.select{|i|i.email!=nil}.collect{|i| i.email}.join(", ") }
  end
end
