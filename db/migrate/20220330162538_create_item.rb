class CreateItem < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :cost
      t.references :manufacturer_items, foreign_key: true
      t.timestamps
    end
  end
end
