class ItemController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @project = @item.project
    @manufacturers = @item.manufacturers
  end
end
