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
      @project = Project.create!(name: "Create Life", manager: "Dr. Frankenstein")

      @monster = @project.items.create!(name: "Monster", cost: 1000)
      @lab = @monster.manufacturers.create!(name: "Frankenstein's Lab", location: "Ingolstadt, Germany")
      @graveyard = @monster.manufacturers.create!(name: "Ingolstadt Graveyard", location: "Ingolstadt, Germany")
      @storm = @monster.manufacturers.create!(name: "Lightning Storm", location: "Europe")
    end

    it '#manufacturer_count returns the number of manufacturers' do
      expect(@monster.manufacturer_count).to eq(3)
    end
  end
end
