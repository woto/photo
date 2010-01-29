class PaperType < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name

  has_many :paper_prices, :dependent => :destroy

  include ToDropdownMixin
end
