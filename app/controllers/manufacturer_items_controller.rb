class ManufacturerItemsController < ApplicationController
  def create
    manufacturer_item = ManufacturerItem.new({
      manufacturer_id: params[:new_manufacturer],
      item_id: params[:id]
    })
    manufacturer_item.save
    redirect_to "/items/#{params[:id]}"
  end
end
