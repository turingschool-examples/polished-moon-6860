class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @project = Project.find(@item[:project_id])
    @manufacturers = ManufacturerItem.all.find_all { |i| i.item_id == @item.id}
  end


end
