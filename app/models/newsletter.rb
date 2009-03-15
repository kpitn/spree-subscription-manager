class Newsletter < ActiveRecord::Base
  belongs_to :mailing_list
  
  validates_presence_of :subject
  validates_presence_of :body
end
