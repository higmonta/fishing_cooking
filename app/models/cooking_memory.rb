class CookingMemory < ApplicationRecord
  after_initialize :default_image

  belongs_to :user
  has_one_attached :cooking_memory_image
  validates :cooking_name, presence: true
  validates :fish_name, presence: true

  def default_image
    if !self.cooking_memory_image.attached?
      self.cooking_memory_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'cooking_memory', 'default.jpg').to_s), filename: 'default.jpg', content_type: 'image/png/jpg')
    end
  end
end
