class CookingInformation < ApplicationRecord
  belongs_to :cooking
  belongs_to :fish
  belongs_to :handle
  validates :cooking_id, uniqueness: { scope: [:fish_id, :handle_id] }
  validates :cooking_time, presence: true
  validates :cooking_url, presence: true
  validates :after_handle_fish_processing_time, presence: true
  validates :rest_fish_time, presence: true
  validates :cooking_total_time, presence: true
end
