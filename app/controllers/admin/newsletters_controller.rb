class Admin::NewslettersController < ApplicationController
  require_role "admin" # You might want to remove this, and add security in the /config/easy_role_permissions.yml file
  layout 'admin'

  resource_controller

  create.response do |wants|
    wants.html { redirect_to admin_newsletters_path }
  end

  update.response do |wants|
    wants.html { redirect_to admin_newsletters_path  }
  end

end