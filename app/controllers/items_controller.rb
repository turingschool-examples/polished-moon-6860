class ItemsController < ApplicationController

  def show
    # binding.pry
    @item = Item.find(params[:id])
    @project = Project.find(@item.project_id)
    # binding.pry
  end

  private

  def item_params
    params.permit(:name, :cost)
  end
end
