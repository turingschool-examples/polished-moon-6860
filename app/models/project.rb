class Project < ApplicationRecord
  validates_presence_of :name, :manager
  has_many :items

  def show
    @project = Project.find(params[:id])
  end

  def average_cost_of_items_by_name
    items = items.where("project_id = #{params[:id]} AND item_name = #{params[:item_name]}")
    items.each {|item| item.cost}
    item.cost.average.to_f.round(2)
  end

  private
    def project_params
      params.permit(:id, :name, :manager, :items)
    end
end
