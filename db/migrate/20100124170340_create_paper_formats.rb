class CreatePaperFormats < ActiveRecord::Migration
  def self.up
    create_table :paper_formats do |t|
      t.float :width
      t.float :height

      t.timestamps
    end
  end

  def self.down
    drop_table :paper_formats
  end
end
