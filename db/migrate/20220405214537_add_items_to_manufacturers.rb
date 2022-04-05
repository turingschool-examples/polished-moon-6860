class AddItemsToManufacturers < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :manufacturers, foreign_key: true
  end
end
