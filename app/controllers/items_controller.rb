class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @manufacture_count = @item.num_manufacturers
  end
end 
