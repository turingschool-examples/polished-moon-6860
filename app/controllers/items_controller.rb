class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.permit(:id, :name, :cost)
  end
end
