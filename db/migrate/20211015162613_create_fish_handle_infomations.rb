class CreateFishHandleInfomations < ActiveRecord::Migration[6.0]
  def change
    create_table :fish_handle_informations do |t|
      t.references :fish, null: false, foreign_key: true
      t.references :handle, null: false, foreign_key: true
      t.time :handle_time, null: false
      t.string :handle_url

      t.timestamps
    end
  end
end
