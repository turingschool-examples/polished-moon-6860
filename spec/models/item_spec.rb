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

  describe 'instance method' do
    it 'can return a count of all manufacturers of a particular item' do
      @manu_1 = Manufacturer.create!(name: 'make it', location: 'colorado')
      @manu_2 = Manufacturer.create!(name: 'have it', location: 'florida')

      @project_1 = Project.create!(name: 'my project', manager: 'john')
      @item_1 = @project_1.items.create!(name: 'product one', cost: 2356)

      ManufacturerItem.create!(manufacturer: @manu_1, item: @item_1)
      ManufacturerItem.create!(manufacturer: @manu_2, item: @item_1)

      expect(@item_1.count_of_manufacturers).to eq(2)
    end
  end
end