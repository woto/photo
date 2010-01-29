class PrinterType < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :paper_prices, :dependent => :destroy

  include ToDropdownMixin
end
