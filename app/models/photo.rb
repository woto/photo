class Photo < ActiveRecord::Base
  belongs_to :image
  belongs_to :paper_price
  belongs_to :order
end
