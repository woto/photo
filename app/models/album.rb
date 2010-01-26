class Album < ActiveRecord::Base
  validates_presence_of :artist
end
