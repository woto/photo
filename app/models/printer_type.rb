class PrinterType < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, :message => "Такой тип печатного устройства уже имеется"
end
