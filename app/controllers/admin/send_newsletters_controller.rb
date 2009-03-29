class Admin::SendNewslettersController < Admin::BaseController
  require_role "admin" # You might want to remove this, and add security in the /config/easy_role_permissions.yml file

  before_filter :get_newsletter, :only=>[:new,:create]
#  resource_controller

#  create.response do |wants|
#    wants.html { redirect_to admin_newsletters_path }
#  end
#
#  update.response do |wants|
#    wants.html { redirect_to admin_newsletters_path  }
#  end
  def new

        
  end

  def create
    #users=User.find(:all,:include=>:subscriptions)
    users=User.find_by_sql("select * from users inner join subscriptions ON (users.id=subscriptions.user_id)")

    1.times do
      users.each do |user|
          NewsletterMailer.deliver_send_newsletter(@newsletter,user) rescue next
      end
    end

    redirect_to admin_newsletters_path
  end

  
  protected

  def get_newsletter
       @newsletter=Newsletter.find(params[:newsletter_id])
  end

end