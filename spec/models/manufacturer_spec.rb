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

  # describe 'Instance Methods' do
  #   it 'can list the names of items belonging to each manufacturer' do
  #     manu_1 = Manufacturer.create!(name: 'make it', location: 'colorado')
  #
  #     project_1 = Project.create!(name: 'my project', manager: 'john')
  #     item_1 = project_1.items.create!(name: 'product one', cost: 2356)
  #
  #     project_2 = Project.create!(name: 'other', manager: 'mary')
  #     item_2 = project_2.items.create!(name: 'something else', cost: 5469)
  #
  #     project_4 = Project.create!(name: 'what', manager: 'tom')
  #     item_4 = project_4.items.create!(name: 'goods', cost: 9174)
  #
  #     ManufacturerItem.create!(manufacturer: manu_1, item: item_1)
  #     ManufacturerItem.create!(manufacturer: manu_1, item: item_2)
  #     ManufacturerItem.create!(manufacturer: manu_1, item: item_4)
  #
  #     expect(manu_1.associated_items).to eq([item_1.name, item_2.name, item_4.name])
  #   end
  # end
end