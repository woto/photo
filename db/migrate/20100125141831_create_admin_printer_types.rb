class CreateAdminPrinterTypes < ActiveRecord::Migration
  def self.up
    create_table :admin_printer_types do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_printer_types
  end
end
