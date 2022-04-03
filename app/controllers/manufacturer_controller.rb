class ManufacturerController < ApplicationController

  def index
    @manufacturers = Manufacturer.all
    # require 'pry'; binding.pry
  end
end
