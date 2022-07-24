class AddUniqueConstraintToCookingInformations < ActiveRecord::Migration[6.0]
  def change
    add_index :cooking_informations, [:fish_id, :cooking_id, :handle_id], unique: true, name: 'fish_id_cooking_id_handle_id_index'
  end
end
