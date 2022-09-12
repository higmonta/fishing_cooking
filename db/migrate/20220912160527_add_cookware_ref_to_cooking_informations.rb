class AddCookwareRefToCookingInformations < ActiveRecord::Migration[6.0]
  def change
    add_reference :cooking_informations, :cookware, foreign_key: true, index: true
  end
end
