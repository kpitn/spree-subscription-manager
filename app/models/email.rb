class Email < ActiveRecord::Base
  validates_presence_of :from, :to, :mail

  belongs_to :send, :polymorphic => true
  
end
