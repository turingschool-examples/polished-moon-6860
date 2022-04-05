class ItemsController < ApplicationController

  def new

  end

  def create
    @item = Item.create!(item_params)
  end

  def show
    @item = Item.find(params[:id])
  end
end
