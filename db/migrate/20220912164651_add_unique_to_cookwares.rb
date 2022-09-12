class AddUniqueToCookwares < ActiveRecord::Migration[6.0]
  def change
    add_index :cookwares, :name, unique: true
  end
end
