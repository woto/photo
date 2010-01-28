class PaperPrice < ActiveRecord::Base
  belongs_to :paper_format
  belongs_to :paper_type
  belongs_to :printer_type
  validates_numericality_of :price
end
