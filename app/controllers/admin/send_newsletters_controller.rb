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

#    log_ok=Logger.new("#{RAILS_ROOT}/log/newsletter/#{DateTime.now.strftime("%Y%m%d_%H%d%S")}_ok.yml")
#    log_not_ok=Logger.new("#{RAILS_ROOT}/log/newsletter/#{DateTime.now.strftime("%Y%m%d_%H%d%S")}_not_ok.yml")

    #users=User.find_by_sql("select * from users inner join subscriptions ON (users.id=subscriptions.user_id)")
    users=User.find_all_by_login("pierre.basile@gmail.com")
    #users=@newsletter.mailing_list.users


    users.each do |user|
      NewsletterMailer.deliver_send_newsletter(@newsletter,user)
    end

    @newsletter.sended_at=Time.now
    @newsletter.save
    redirect_to admin_newsletters_path
  end

  
  protected

  def get_newsletter
    @newsletter=Newsletter.find_by_permalink(params[:newsletter_id])
  end

end


