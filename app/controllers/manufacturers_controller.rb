class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  private

  def manufacturer_params
    params.permit(:id, :name, :location)
  end
end
