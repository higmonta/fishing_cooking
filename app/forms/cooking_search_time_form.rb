class CookingSearchTimeForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  
  attribute :fish_kind, :string
  attribute :cooking_name, :string

  validates :fish_kind, presence: true
  validates :cooking_name, presence: true

  def save
    invalid? ? false : true
  end

  def handle_search
    cooking_id = Cooking.find_by(name: cooking_name).id
    fish_id = Fish.find_by(kind: fish_kind).id
    handle_id = CookingInformation.find_by(cooking_id: cooking_id, fish_id: fish_id).handle_id
    Handle.find(handle_id).pattern
  end

  def cooking_information_search
    cooking_id = Cooking.find_by(name: cooking_name).id
    fish_id = Fish.find_by(kind: fish_kind).id
    CookingInformation.find_by(cooking_id: cooking_id, fish_id: fish_id)
  end
end