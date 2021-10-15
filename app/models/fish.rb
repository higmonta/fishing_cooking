class Fish < ApplicationRecord
  has_many :cooking_informations
  has_many :cookings, through: :cooking_informations
  has_many :fish_handle_informations
  has_many :handles, through: :fish_handle_informations
end
