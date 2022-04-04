require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :manager }
  end

  describe 'relationships' do
    it { should have_many :items }
  end

  describe 'instance method' do
    @manu_1 = Manufacturer.create!(name: 'make it', location: 'colorado')

    @project_1 = Project.create!(name: 'my project', manager: 'john')
    @item_1 = @project_1.items.create!(name: 'product one', cost: 2356)
    @item_2 = @project_1.items.create!(name: 'different', cost: 5434)

    ManufacturerItem.create!(manufacturer: @manu_1, item: @item_1)

    it 'can calculate the average cost of items in the project' do

      expect("#{@project_1.average_item_cost}").to eq(38.95)
    end
  end
end