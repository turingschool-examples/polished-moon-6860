class ManufacturersController < ApplicationController

  def index
    # binding.pry
    @manufacturers = Manufacturer.all
  end
end
