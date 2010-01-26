class PaperFormat < ActiveRecord::Base
  validates_numericality_of :width
  validates_numericality_of :height
  validates_uniqueness_of :width, :scope => :height
  validates_uniqueness_of :height, :scope => :width
end
