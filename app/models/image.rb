class Image < ActiveRecord::Base
  attr_accessible :name, :image
  has_attached_file :image
  validates :name, uniqueness: true

end
