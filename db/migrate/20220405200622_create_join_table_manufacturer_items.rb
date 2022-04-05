class CreateJoinTableManufacturerItems < ActiveRecord::Migration[5.2]
  def change
    create_join_table :manufacturers, :items, table_name: :manufacturer_items do |t|
      # t.index [:manufacturer_id, :item_id]
      # t.index [:item_id, :manufacturer_id]
    end
  end
end
