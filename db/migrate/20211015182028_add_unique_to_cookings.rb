class AddUniqueToCookings < ActiveRecord::Migration[6.0]
  def change
    add_index :cookings, :name, unique: true
  end
end
