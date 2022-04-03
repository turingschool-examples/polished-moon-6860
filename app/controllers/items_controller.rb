class ItemsController < ApplicationController

  def show
    # binding.pry
    @item = Item.find(params[:id])
    @project = Project.find(@item.project_id)
    # binding.pry
  end

end
