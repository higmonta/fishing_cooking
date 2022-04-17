class CookingMemory < ApplicationRecord
  belongs_to :user
  has_one_attached :cooking_memory_image
  validates :cooking_name, presence: true
  validates :fish_name, presence: true
end
