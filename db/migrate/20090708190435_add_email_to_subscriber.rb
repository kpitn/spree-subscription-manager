class AddEmailToSubscriber < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :email, :string, :limit =>50
    add_index :subscriptions,:email,:unique=>true
  end

  def self.down
    remove_column :subscriptions, :email
  end
end
