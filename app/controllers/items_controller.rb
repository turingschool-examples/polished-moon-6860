class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    manufacturer = Manufacturer.find(params["Manufacturer ID"])
    ManufacturerItem.create!(manufacturer_id: manufacturer.id, item_id: item.id)
    redirect_to "/items/#{item.id}"
  end
end
