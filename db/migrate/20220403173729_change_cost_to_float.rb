class ChangeCostToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :cost, :float
  end
end
