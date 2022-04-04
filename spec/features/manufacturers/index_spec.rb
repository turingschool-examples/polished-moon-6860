require 'rails_helper'

RSpec.describe 'manufacturers index page' do
  before do
    @hammer_co = Manufacturer.create!(name: "Hammer Company", location: "Turkey Town")
    @wrench_inc = Manufacturer.create!(name: "Wrench Inc.", location: "West City")
    @driver_co = Manufacturer.create!(name: "Screwdriver Man", location: "Denver")

    @fence = Project.create!(name: 'New Fence Project', manager: 'Skeeter')
    # hammer = fence.items.create!(name: 'Big Ole Hammer', cost: 55)
    @hammer = @fence.items.create!(name: 'Big Ole Hammer', cost: 55)
    @screw = @fence.items.create!(name: 'A Screwdriver', cost: 17)
    @wrench = @fence.items.create!(name: 'This Wrench', cost: 35)
    @drill = @fence.items.create!(name: 'Nice Drill', cost: 98)
    @socket = @fence.items.create!(name: 'Socket Set', cost: 65)
    @putty = @fence.items.create!(name: 'Putty Knife', cost: 200)

    @ham1 = ManufacturerItem.create!(item: @hammer, manufacturer: @hammer_co)
    @ham2 = ManufacturerItem.create!(item: @putty, manufacturer: @hammer_co)

    @w_1 = ManufacturerItem.create!(item: @screw, manufacturer: @wrench_inc)
    @w_2 = ManufacturerItem.create!(item: @socket, manufacturer: @wrench_inc)
    @w_3 = ManufacturerItem.create!(item: @putty, manufacturer: @wrench_inc)

    @d_1 = ManufacturerItem.create!(item: @wrench, manufacturer: @driver_co)
    @d_2 = ManufacturerItem.create!(item: @drill, manufacturer: @driver_co)
    @d_3 = ManufacturerItem.create!(item: @screw, manufacturer: @driver_co)
    @d_4 = ManufacturerItem.create!(item: @putty, manufacturer: @driver_co)
  end
  describe 'As a visitor' do

    it 'I see a list of names of all manufacturers, each as items they belong to' do
      visit "/manufacturers"

      save_and_open_page
      
      expect(page).to have_content("Name: #{@hammer_co.name}")
      expect(page).to have_content("Name: #{@wrench_inc.name}")
      expect(page).to have_content("Name: #{@driver_co.name}")

      within "#manu-#{@hammer_co.id}" do
        expect(page).to have_content("Item Name: #{@hammer.name}")
        expect(page).to have_content("Item Name: #{@putty.name}")
      end


    end








  end


end
