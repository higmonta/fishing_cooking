class Handle < ApplicationRecord
  has_many :fish_handle_informations
  has_many :fish, through: :fish_handle_informations
  has_many :cooking_informations
end
