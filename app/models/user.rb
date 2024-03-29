class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 10 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password, presence: true, unless: -> { validation_context == :not_password_validation }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :name, presence: true

  has_many :cooking_memories, dependent: :destroy
end
