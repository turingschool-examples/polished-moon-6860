class ItemsController < ApplicationController
  def show
    @items = Item.find(params[:id])
    @project = Project.find(@items.project_id)
  end

  private

  def item_params
    params.permit(:name, :cost)
  end
end
