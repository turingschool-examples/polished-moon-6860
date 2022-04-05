class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
    @items = Item.all
  end
end
