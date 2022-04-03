class CreateItemManufacturers < ActiveRecord::Migration[5.2]
  def change
    create_table :item_manufacturers do |t|
      t.references :item, foreign_key: true
      t.references :manufacturer, foreign_key: true
    end
  end
end
