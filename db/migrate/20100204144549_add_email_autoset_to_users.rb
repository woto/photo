class AddEmailAutosetToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :email_autoset, :string
  end

  def self.down
    remove_column :users, :email_autoset
  end
end
