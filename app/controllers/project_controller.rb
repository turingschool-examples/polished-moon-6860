class ProjectController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @average_cost = @project.items.average(:cost).round
  end
end
