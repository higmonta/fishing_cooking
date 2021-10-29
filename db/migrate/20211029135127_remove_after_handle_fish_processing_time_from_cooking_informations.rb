class RemoveAfterHandleFishProcessingTimeFromCookingInformations < ActiveRecord::Migration[6.0]
  def change
    remove_column :cooking_informations, :after_handle_fish_processing_time, :integer
  end
end
