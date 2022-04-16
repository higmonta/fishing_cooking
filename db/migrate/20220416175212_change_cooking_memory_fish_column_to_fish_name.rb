class ChangeCookingMemoryFishColumnToFishName < ActiveRecord::Migration[6.0]
  def change
    rename_column :cooking_memories, :fish, :fish_name
  end
end
