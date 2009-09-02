class Newsletter < ActiveRecord::Base
  belongs_to :mailing_list
  
  validates_presence_of :subject
  validates_presence_of :body

  make_permalink
  
  def to_param
    return permalink unless permalink.blank?
    subject.to_url
  end

end
