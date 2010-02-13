class AddUsernameAutosetToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :username_autoset, :boolean
  end

  def self.down
    remove_column :users, :username_autoset
  end
end
