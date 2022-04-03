class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @project = Project.find(@item.project_id)
  end

  def update
    manufacturer = Manufacturer.find(params[:manufacturer])
    item = Item.find(params[:id])
    ManufacturerItem.create!(manufacturer_id: manufacturer.id, item_id: item.id)
    redirect_to "/items/#{item.id}"
  end
end