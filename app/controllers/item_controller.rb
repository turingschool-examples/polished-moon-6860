class ItemController < ApplicationController
  def show
    # require 'pry'; binding.pry
    @item = Item.find(params[:id])
    @project = @item.project
  end
end
