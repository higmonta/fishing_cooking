class CreateCookingInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :cooking_informations do |t|
      t.references :cooking, null: false, foreign_key: true
      t.references :fishes, null: false, foreign_key: true
      t.string :image
      t.integer :cooking_time, null: false
      t.string :cooking_url
      t.references :handle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
