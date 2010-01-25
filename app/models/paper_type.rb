class PaperType < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name, :message => "Такой тип бумаги уже имеется"
end
