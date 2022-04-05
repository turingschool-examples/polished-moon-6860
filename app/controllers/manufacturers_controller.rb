class ManufacturersController < ApplicationController

  def index
    @all_manu = Manufacturer.all
  end

end
