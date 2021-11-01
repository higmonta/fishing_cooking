class AddUniqueToFish < ActiveRecord::Migration[6.0]
  def change
    add_index :fishes, :kind, unique: true
  end
end
