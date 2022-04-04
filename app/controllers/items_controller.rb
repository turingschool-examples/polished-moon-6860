class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @project_name = @item.project[:name]
  end
end