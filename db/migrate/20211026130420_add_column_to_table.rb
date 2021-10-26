class AddColumnToTable < ActiveRecord::Migration[6.0]
  def change
    add_column :cooking_informations, :after_handle_fish_processing_time, :integer, null: false
    add_column :cooking_informations, :rest_fish_time, :integer, null: false
    add_column :cooking_informations, :cooking_total_time, :integer, null: false
  end
end
