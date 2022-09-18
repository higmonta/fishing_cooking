class CalculateCookingTimeForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :let_foodstuff_capacity, :float
  attribute :cookware_capacity, :float
  attribute :count, :integer

  validates :let_foodstuff_capacity, presence: true
  validates :cookware_capacity, presence: true
  validates :count, presence: true

  def save
    invalid? ? false : true
  end
end
