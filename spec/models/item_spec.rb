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
    before :each do
      @manufacturer1 = Manufacturer.create!(name: "Pabus shop", location: "Ferret land")
      @project = Project.create!(name: "Pabus Ferret Shop", manager: "Pabu")
      @item1 = @manufacturer1.items.create!(name: "Shampoo", cost: 20, project_id: @project.id)
    end
    it 'shows count of manufacturers' do
      expect(@item1.manufacturer_count).to eq(1)
    end
  end
end
