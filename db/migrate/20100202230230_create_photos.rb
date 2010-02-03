class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.references :image
      t.references :paper_price
      t.references :order
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
