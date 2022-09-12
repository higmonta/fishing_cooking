class CookingInformation < ApplicationRecord
  belongs_to :cooking
  belongs_to :fish
  belongs_to :handle
  belongs_to :cookware
  validates :cooking_id, uniqueness: { scope: %i[fish_id handle_id] }
  validates :cooking_id, uniqueness: { scope: :fish_id }
  validates :cooking_time, presence: true
  validates :cooking_url, presence: true
  validates :rest_fish_time, presence: true
  validates :cooking_total_time, presence: true
end
