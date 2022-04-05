class ManufacturersController < ApplicationController

  def index
    @all_manu = Manufacturer.all
    #binding.pry
    #@this_manu = Manufacturer.find(params[:id])
    #@all_item = @this_manu.find_items
  end

end
