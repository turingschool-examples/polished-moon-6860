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
    it "calculates the number of manufacturers for this item" do
      fence = Project.create!(name: "fence repair", manager: "Bob the Builder")
      hammer = Item.create!(name: "hammer", cost: 3, project_id: fence.id)
      drill = Item.create!(name: "drill", cost: 5, project_id: fence.id)
      boards = Item.create!(name: "boards", cost: 4, project_id: fence.id)
      
      ryobi = Manufacturer.create!(name: "Ryobi", location: "Denver")
      board_maker = Manufacturer.create!(name: "Board Maker", location: "The Forest")
      hammer_co = Manufacturer.create!(name: "Hammer Company", location: "Hamburg")
      
      manufacturer_item1 = ManufacturerItem.create!(manufacturer_id: ryobi.id, item_id: hammer.id)
      manufacturer_item2 = ManufacturerItem.create!(manufacturer_id: ryobi.id, item_id: drill.id)
      manufacturer_item3 = ManufacturerItem.create!(manufacturer_id: board_maker.id, item_id: boards.id)
      manufacturer_item4 = ManufacturerItem.create!(manufacturer_id: hammer_co.id, item_id: hammer.id)
      
      expect(hammer.manufacturer_count).to eq(2)
      expect(drill.manufacturer_count).to eq(1)
      expect(boards.manufacturer_count).to eq(1)
    end
  end
end