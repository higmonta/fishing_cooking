module ApplicationHelper
  def cooking_image_path(fish_id:, cooking_id:)
    "cooking/#{Fish.find(fish_id).kind}/#{Cooking.find(cooking_id).name}.jpg"
  end
end
