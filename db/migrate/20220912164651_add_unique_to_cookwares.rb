class AddUniqueToCookwares < ActiveRecord::Migration[6.0]
  def change
    add_index :cookwares, :type, unique: true
  end
end
