class CreateWoto5s < ActiveRecord::Migration
  def self.up
    create_table :woto5s do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :woto5s
  end
end
