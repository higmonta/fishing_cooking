class Cooking < ApplicationRecord
  has_many :cooking_informations
  has_many :fish, through: :cooking_informations, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
