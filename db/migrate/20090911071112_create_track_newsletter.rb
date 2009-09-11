class CreateTrackNewsletter < ActiveRecord::Migration
  def self.up
    create_table :newsletter_tracks do |t|
      t.references :newsletter
      t.references :subscription
      t.string :state
    end
    add_index :newsletter_tracks, [:newsletter_id,:subscription]


    add_column :emails, :send_id,:integer
    add_column :emails, :send_type,:string,:limit =>50
  end

  def self.down
    drop_table :newsletter_tracks
  end
end
