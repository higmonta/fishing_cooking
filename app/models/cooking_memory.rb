class CookingMemory < ApplicationRecord
  belongs_to :user
  has_one_attached :cooking_memory_image
  validates :cooking_name, presence: true
  validates :fish_name, presence: true

  def need_default_image?
    if !self.cooking_memory_image.attached?
      self.cooking_memory_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'cooking_memory', 'default.png').to_s), filename: 'default.png', content_type: 'image/png/jpg')
    end
  end
end
