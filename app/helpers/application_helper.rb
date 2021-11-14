module ApplicationHelper
  def cooking_image_path(fish_id:, cooking_id:)
    "cooking/#{Fish.find(fish_id).kind}/#{Cooking.find(cooking_id).name}.jpg"
  end

  def operation_total_time(fish_id:, handle_id:, cooking_information:)
    FishHandleInformation.find_by(fish_id: fish_id, handle_id: handle_id).handle_time + cooking_information.cooking_total_time
  end
end
