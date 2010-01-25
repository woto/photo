class CreatePrinterTypes < ActiveRecord::Migration
  def self.up
    create_table :printer_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :printer_types
  end
end
