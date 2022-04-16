class CookingMemory < ApplicationRecord
  belongs_to :user
  has_one_attached :cooking_memory_image
end
