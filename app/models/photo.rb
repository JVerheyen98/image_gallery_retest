class Photo < ApplicationRecord
  belongs_to :gallery
  #ensure that a photo is attached
  has_one_attached :image
end
