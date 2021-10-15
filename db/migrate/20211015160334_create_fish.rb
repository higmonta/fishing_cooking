class CreateFish < ActiveRecord::Migration[6.0]
  def change
    create_table :fish do |t|
      t.string :kind, null: false

      t.timestamps
    end
  end
end
