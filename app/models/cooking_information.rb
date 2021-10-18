class CookingInformation < ApplicationRecord
  belongs_to :cooking
  belongs_to :fish
  belongs_to :handle
  validates :cooking_id, uniqueness: { scope: [:fish_id, :handle_id] }
  validates :cooking_time, presence: true
  validates :cooking_url, presence: true
end
