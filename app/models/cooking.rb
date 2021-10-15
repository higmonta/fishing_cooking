class Cooking < ApplicationRecord
  has_many :cooking_informations
  has_many :fish, through: :cooking_informations
end
