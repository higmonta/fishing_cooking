class AddUniqueToHandles < ActiveRecord::Migration[6.0]
  def change
    add_index :handles, :type, unique: true
  end
end
