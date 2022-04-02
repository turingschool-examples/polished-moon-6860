class ChangeCostToDecimal < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :cost, :decimal, precision: 10, scale: 2
  end
end
