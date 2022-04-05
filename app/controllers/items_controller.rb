class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @manufacture_count = @item.manufacturers.count
  end
end 
