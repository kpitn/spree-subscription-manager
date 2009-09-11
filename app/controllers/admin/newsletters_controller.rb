class Admin::NewslettersController < Admin::BaseController
  resource_controller

  edit.before do
    @main_images=MainImage.find(:all,:conditions=>["viewable_id=? and viewable_type='Newsletter'",@newsletter.id])
    @viewable_id=@newsletter.id
    @viewable_type="Newsletter"
    @back=edit_admin_newsletter_url(@newsletter)
  end

  create.response do |wants|
    wants.html { redirect_to admin_newsletters_path }
  end

  update.response do |wants|
    wants.html { redirect_to admin_newsletters_path  }
  end


  show.response do |wants|
    wants.html{render :layout=>"newsletter"}
  end


  def see

  end

end