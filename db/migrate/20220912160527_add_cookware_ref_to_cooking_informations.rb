class AddCookwareRefToCookingInformations < ActiveRecord::Migration[6.0]
  def change
    add_reference :cooking_informations, :cookware, null: false, foreign_key: true, index: true
  end
end
