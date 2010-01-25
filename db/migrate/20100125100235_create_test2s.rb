class CreateTest2s < ActiveRecord::Migration
  def self.up
    create_table :test2s do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :test2s
  end
end
