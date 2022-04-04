require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
  end

  describe 'relationships' do
    it { should have_many :manufacturer_items }
    it { should have_many(:items).through(:manufacturer_items) }
  end
    

  describe 'instance method' do 
    before :each do 
    @project_1 = Project.create!(name: "Nicer Things", manager: "Kim G")
    @item_1 = @project_1.items.create!(name: "Nintendo Switch", cost: 349)
    @item_2 = @project_1.items.create!(name: "Nintendo Switch2", cost: 349)
    @manufacturer_1 = Manufacturer.create!(name: "Nintendo", location: "Japan")
    @manufacturer_item_1 = ManufacturerItem.create!(manufacturer: @manufacturer_1, item: @item_1)
    @manufacturer_item_2 = ManufacturerItem.create!(manufacturer: @manufacturer_1, item: @item_2)
    end

    it 'lists all items by a manufacturer' do 
      expect(@manufacturer_1.list_items).to eq([@item_1.name, @item_2.name])
    end

  end
end