require 'rails_helper'

RSpec.describe Item, type: :model do
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

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cost }
  end

  describe 'relationships' do
    it { should belong_to :project }
    it { should have_many :manufacturer_items }
    it { should have_many(:manufacturers).through(:manufacturer_items) }
  end

  describe 'methods' do

    it 'gives the count of an items number of manufacturers' do
      expect(@putty.manufacturer_count).to eq(3)
      expect(@screw.manufacturer_count).to eq(2)
      expect(@hammer.manufacturer_count).to eq(1)
    end

  end
end
