class Cookware < ApplicationRecord
  has_many :cooking_informations
  validates :name, uniqueness: { case_sensitive: false }, presence: true
end
