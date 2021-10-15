class CookingInformation < ApplicationRecord
  belongs_to :cooking
  belongs_to :fish
  belongs_to :handle
end
