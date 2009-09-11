class NewsletterTrack < ActiveRecord::Base
  belongs_to :newsletter
  belongs_to :subscription
end
