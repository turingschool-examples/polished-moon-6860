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
    describe '#item_made_by_manufacturers' do
      it 'returns the number of manufacturers for an item' do

          @hammer = Manufacturer.create!(name:"Hammers R us", location:"123 Anywhere USA")
          @project_1 = Project.create!(name:"John House", manager: "Bob")
          @item_1 = @project_1.items.create!(name:"Hammer", cost: 20)

          @hammer_item1 = ManufacturerItem.create!(item_id: @item_1.id, manufacturer_id: @hammer.id)
          @hammer_item2 = ManufacturerItem.create!(item_id: @item_1.id, manufacturer_id: @hammer.id)

        expect(@item_1.item_made_by_manufacturers).to eq(2)
      end
    end
  end
end
