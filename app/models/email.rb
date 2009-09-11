class Email < ActiveRecord::Base
  validates_presence_of :from, :to, :mail

  belongs_to :sender, :polymorphic => true
  
end
