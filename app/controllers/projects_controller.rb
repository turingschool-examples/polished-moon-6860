class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @average_item_cost = @project.average_item_cost.round(2)
  end
end
