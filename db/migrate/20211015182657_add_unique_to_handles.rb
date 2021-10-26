class AddUniqueToHandles < ActiveRecord::Migration[6.0]
  def change
    add_index :handles, :pattern, unique: true
  end
end
