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

  describe 'class methods' do
    it 'has a count of manufacturers' do
      project_1 = Project.create!(name: 'New Summer Toy', manager: 'John Doe')
      item_1 = project_1.items.create!(name: 'Ball', cost: 5)
      usa_supply_1 = item_1.manufacturers.create(name: 'Toy Supply Co', location: 'USA')
      mx_supply = item_1.manufacturers.create(name: 'Toys International', location: 'MX')
      expect(item_1.manufacturer_count).to eq(2)
    end
  end
end
