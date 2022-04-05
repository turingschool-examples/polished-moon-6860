class AddColumnToManufacturers < ActiveRecord::Migration[5.2]
  def change
    add_column :manufacturers, :location, :string
  end
end
