require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cost }
  end

  describe 'relationships' do
    it { should belong_to :project }
    it { should have_many :manufacturer_items }
    it { should have_many(:manufacturers).through(:manufacturer_items) }
  end

  describe 'instance methods' do
    before (:each) do
      @project = Project.create!(name: "New House", manager: "Joe Smith")

      @manufacturer1 = Manufacturer.create!(name: "Woody's Furniture", location: "Dallas, TX")
      @manufacturer2 = Manufacturer.create!(name: "Light it Up", location: "Spokane, WA")
      @manufacturer3 = Manufacturer.create!(name: "Drapes n Things", location: "Raleigh, NC")

      @item1 = @project.items.create!(name: "Chair", cost: 34)
      @item2 = @project.items.create!(name: "Bed frame", cost: 340)
      @item3 = @project.items.create!(name: "Blackout curtains", cost: 65)

      ManufacturerItem.create!(item: @item1, manufacturer: @manufacturer1)
      ManufacturerItem.create!(item: @item1, manufacturer: @manufacturer3)
      ManufacturerItem.create!(item: @item2, manufacturer: @manufacturer1)
      ManufacturerItem.create!(item: @item3, manufacturer: @manufacturer2)
      ManufacturerItem.create!(item: @item3, manufacturer: @manufacturer3)
    end

    it '#manu_count' do
      expect(@item1.manu_count).to eq(2)
      expect(@item2.manu_count).to eq(1)
      expect(@item3.manu_count).to eq(2)
    end
  end

end
