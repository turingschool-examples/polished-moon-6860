class ItemController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @project = @item.project
    @manufacturers = @item.manufacturer_count
  end
end
