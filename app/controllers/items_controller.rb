class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @project = Project.find(@item.project_id)
  end


end
