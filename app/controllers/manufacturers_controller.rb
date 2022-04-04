class ItemsController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  private

  def item_params
    params.permit(:id, :name, :location)
  end
end
