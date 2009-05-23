class Admin::NewslettersController < Admin::BaseController
  resource_controller

  create.response do |wants|
    wants.html { redirect_to admin_newsletters_path }
  end

  update.response do |wants|
    wants.html { redirect_to admin_newsletters_path  }
  end

end