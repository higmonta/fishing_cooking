class CreateCookingMemories < ActiveRecord::Migration[6.0]
  def change
    create_table :cooking_memories do |t|
      t.string :cooking_name, null: false
      t.string :fish, null: false
      t.date :cooking_date
      t.text :memo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
