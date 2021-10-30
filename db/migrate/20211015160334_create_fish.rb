class CreateFish < ActiveRecord::Migration[6.0]
  def change
    create_table :fishes do |t|
      t.string :kind, null: false

      t.timestamps
    end
  end
end
