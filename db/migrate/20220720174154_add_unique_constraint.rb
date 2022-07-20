class AddUniqueConstraint < ActiveRecord::Migration[6.0]
  def change
    add_index :fish_handle_informations, [:fish_id, :handle_id], unique: true
  end
end
