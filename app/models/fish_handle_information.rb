class FishHandleInformation < ApplicationRecord
  belongs_to :fish
  belongs_to :handle
  validates :fish_id, uniqueness: { scope: :handle_id }
  validates :handle_time, presence: true
  validates :handle_url, presence: true
end
