class CookingSearchTimeForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  
  attribute :fish_kind, :string
  attribute :cooking_name, :string
  attribute :count, :integer

  validates :fish_kind, presence: true
  validates :cooking_name, presence: true
  validates :count, presence: true

  def handle_search
    if fish_kind.present?
       cooking_id = Cooking.find_by(name: cooking_name).id
       fish_id = Fish.find_by(kind: fish_kind).id
       handle_id = CookingInformation.find_by(cooking_id: cooking_id, fish_id: fish_id).handle_id
       Handle.find(handle_id).pattern
    end
  end
end