class Permalink < ActiveRecord::Migration
  def self.up
    add_column :newsletters, :permalink, :string
  end

  def self.down
    remove_column :newsletters, :permalink, :string
  end
end
