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

  describe '#manny_cout' do
    it 'counts the number of manufactures an item has' do
      @project_1 = Project.create!(
        name: "Awesome Project",
        manager: "Mark Awesome"
      )

      @item_1 = @project_1.items.create!(
        name: "Awesome Item",
        cost: 99
      )
      @item_2 = @project_1.items.create!(
        name: "Lame Item",
        cost: 1
      )
      @item_3 = @project_1.items.create!(
        name: "Lame Item",
        cost: 1
      )

      @manny_1 = Manufacturer.create!(
        name: "Manny Won",
        location: "The World"
      )
      @manny_2 = Manufacturer.create!(
        name: "Manny Won",
        location: "The World"
      )

      ManufacturerItem.create!(item_id: @item_2.id, manufacturer_id: @manny_1.id)
      ManufacturerItem.create!(item_id: @item_2.id, manufacturer_id: @manny_2.id)
      ManufacturerItem.create!(item_id: @item_1.id, manufacturer_id: @manny_2.id)

      expect(@item_2.manny_count).to eq(2)
      expect(@item_1.manny_count).to eq(1)
    end
  end
end
