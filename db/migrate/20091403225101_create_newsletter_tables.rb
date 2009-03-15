class CreateNewsletterTables < ActiveRecord::Migration
  
  def self.up
    
    create_table :newsletters, :force => true do |t|
      t.text     :body
      t.string   :subject
      t.references :mailing_list
      t.datetime :sended_at
      t.timestamps
    end
    add_index :newsletters, :mailing_list_id

    create_table :send_newsletters, :force => true do |t|
      t.references :newsletter
      t.references :user
      t.boolean :success
      t.timestamps
    end
    add_index :send_newsletters, [:newsletter_id,:user_id]

  end

  def self.down
    drop_table :newsletters
  end
  
end
