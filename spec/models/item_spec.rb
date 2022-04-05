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
    it '#manufacturer_count' do
      project = Project.create!(name: "Pencil Project", manager: "Billy")
      item = project.items.create!(name: "Pencil", cost: "50")
      pencil_works = Manufacturer.create!(name: "Pencil Works", location: "China")
      world_of_erasers = Manufacturer.create!(name: "World of Erasers", location: "Africa")
      ManufacturerItem.create!(manufacturer_id: pencil_works.id, item_id: item.id)
      ManufacturerItem.create!(manufacturer_id: world_of_erasers.id, item_id: item.id)
      expect(item.manufacturer_count).to eq(2)
    end
  end
end
