class CreateHandles < ActiveRecord::Migration[6.0]
  def change
    create_table :handles do |t|
      t.string :type, null: false

      t.timestamps
    end
  end
end
