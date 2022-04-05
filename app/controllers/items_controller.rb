class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    # binding.pry
  end

end
