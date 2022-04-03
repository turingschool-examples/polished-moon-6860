class ManufacturersController < ApplicationController

def index
  @manufacturers = Manufacturer.all
end

def create
  @manufacturer = Manufacturer.create(manufacturer_params)
end

private

    def manufacturer_params
      params.permit(:name, :location)
    end
end
