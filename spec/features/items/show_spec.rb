require 'rails_helper'

RSpec.describe 'Items show page' do
  before do
    @hammer_co = Manufacturer.create!(name: "Hammer Company", location: "Turkey Town")
    @wrench_inc = Manufacturer.create!(name: "Wrench Inc.", location: "West City")
    @driver_co = Manufacturer.create!(name: "Screwdriver Man", location: "Denver")

    @fence = Project.create!(name: 'New Fence Project', manager: 'Skeeter')

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

    it 'I see the items name and cost, and name of project it belongs to' do

      visit "/items/#{@hammer.id}"
      # save_and_open_page
      expect(page).to have_content("Name: #{@hammer.name}")
      expect(page).to have_content("Cost: #{@hammer.cost}")
      expect(page).to have_content("Project: #{@fence.name}")
    end

    it 'I see a count of the number of manufacturers for this item' do

      visit "/items/#{@putty.id}"

      save_and_open_page

      expect(page).to have_content("Name: #{@putty.name}")
      expect(page).to have_content("Cost: #{@putty.cost}")
      expect(page).to have_content("Project: #{@fence.name}")
      expect(page).to have_content("Number of Manufacturers: 3")



    end

  end

end
