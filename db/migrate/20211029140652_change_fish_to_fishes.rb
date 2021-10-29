class ChangeFishToFishes < ActiveRecord::Migration[6.0]
  def change
    rename_table :fish, :fishes
  end
end
