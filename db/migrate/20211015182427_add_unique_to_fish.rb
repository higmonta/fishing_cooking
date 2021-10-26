class AddUniqueToFish < ActiveRecord::Migration[6.0]
  def change
    add_index :fish, :kind, unique: true
  end
end
