class ItemsController < ApplicationController
  def show
    @items = Item.find(params[:id])
  end

  private

  def item_params
    params.permit(:id, :name, :cost)
  end
end
