class ItemController < ApplicationController
  def show
    # require 'pry'; binding.pry
    @item = Item.find(params[:id])
  end
end
