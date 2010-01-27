class CreatePaperPrices < ActiveRecord::Migration
  def self.up
    create_table :paper_prices do |t|
      t.float :price
      t.references :paper_format
      t.references :paper_type
      t.references :printer_type

      t.timestamps
    end
  end

  def self.down
    drop_table :paper_prices
  end
end
