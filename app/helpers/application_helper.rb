module ApplicationHelper
  def cooking_image_path(cooking_information)
    "cooking/#{cooking_information.fish.kind}/#{cooking_information.cooking.name}.jpg"
  end

  def operation_total_time(fish_id:, handle_id:, cooking_information:)
    FishHandleInformation.find_by(fish_id: fish_id, handle_id: handle_id).handle_time
    + cooking_information.cooking_total_time
  end

  def page_full_title(page_title = '')
    base_title = 'Fishing Cook'
    page_title.empty? ? base_title : "#{base_title} | #{page_title}"
  end
end
