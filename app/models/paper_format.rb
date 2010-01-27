class PaperFormat < ActiveRecord::Base
  validates_numericality_of :width, :height
  
  has_many :paper_prices, :dependent => :destroy
  
  #after_validation :swap_width_and_height
  #
  #private 
  #
  #def swap_width_and_height
  #  self[:width], self[:height] = self[:height], self[:width] if self[:width].to_i > self[:height].to_i
  #end

  protected

  def validate
    if PaperFormat.exists?(["(width = :width AND height = :height) 
      OR (height = :width AND width = :height)", {:width => self[:width], :height => self[:height]} ])
      errors.add_to_base "Такая комбинация ширины и высоты уже имеются"
    end
  end

end
