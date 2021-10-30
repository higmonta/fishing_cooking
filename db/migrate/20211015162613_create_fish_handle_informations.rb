class CreateFishHandleInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :fish_handle_informations do |t|
      t.references :fishes, null: false, foreign_key: true
      t.references :handle, null: false, foreign_key: true
      t.integer :handle_time, null: false
      t.string :handle_url

      t.timestamps
    end
  end
end
