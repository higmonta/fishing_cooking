class Cookware < ApplicationRecord
  has_many :cooking_informations
  validates :name, uniqueness: true, presence: true
end
