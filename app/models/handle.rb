class Handle < ApplicationRecord
  has_many :fish_handle_informations
  has_many :fishes, through: :fish_handle_informations, dependent: :destroy
  has_many :cooking_informations
  validates :pattern, uniqueness: { case_sensitive: false }, presence: true
end
