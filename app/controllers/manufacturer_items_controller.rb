class ManufacturerItemsController < ApplicationController

  def create
    @item = Item.find(params[:id])
    @manufacturer = Manufacturer.find(params[:new_manufacturer])
    ManufacturerItem.create!(item: @item, manufacturer: @manufacturer)
    redirect_to "/items/#{@item.id}"
  end
end
