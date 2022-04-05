class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
    # binding.pry
  end
end
