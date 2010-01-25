class PaperFormat < ActiveRecord::Base
  validates_numericality_of :width
  validates_numericality_of :height
end
