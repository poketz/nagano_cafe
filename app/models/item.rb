class Item < ApplicationRecord
  has_one_attached :image
  
  belongs_to :genres
  has_many :cart_items, dependent: :destroy
end
