class CreateCookwares < ActiveRecord::Migration[6.0]
  def change
    create_table :cookwares do |t|
      t.string :type, null: false

      t.timestamps
    end
  end
end
