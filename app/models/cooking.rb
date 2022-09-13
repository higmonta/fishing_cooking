class Cooking < ApplicationRecord
  has_many :cooking_informations
  has_many :fishes, through: :cooking_informations, dependent: :destroy
  validates :name, uniqueness: { case_sensitive: false }, presence: true
end
