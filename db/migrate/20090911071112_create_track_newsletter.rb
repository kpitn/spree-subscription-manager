class CreateTrackNewsletter < ActiveRecord::Migration
  def self.up
    create_table :newsletter_tracks,:force=>true do |t|
      t.references :newsletter
      t.references :subscription
      t.string :state
      t.timestamps
    end
    add_index :newsletter_tracks, [:newsletter_id,:subscription_id]


    add_column :emails, :sender_id,:integer
    add_column :emails, :sender_type,:string,:limit =>50
  end

  def self.down
    drop_table :newsletter_tracks
  end
end
