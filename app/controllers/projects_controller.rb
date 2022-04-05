class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def average_cost_of_items_by_name
    @project = Project.find(params[:id])
    items = @project.items.where("item_name = #{params[:item_name]}")
    items.each {|item| item.cost}
    item.cost.average.to_f.round(2)
  end
end
