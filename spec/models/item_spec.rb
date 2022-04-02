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
      project = Project.create!(name: "NAMM 2023", manager: "James Harkins")
      another_new_strat = project.items.create!(name: "The Newest Strat", cost: 1500)
      another_new_paul = project.items.create!(name: "The Newest Paul", cost: 2500)
      fender = another_new_strat.manufacturers.create!(name: "Fender Guitars", location: "Los Angeles")
      ernie_ball = another_new_strat.manufacturers.create!(name: "Ernie Ball Strings", location: "San Luis Obispo")
      gibson = another_new_paul.manufacturers.create!(name: "Gibson", location: "Nashville")

      expect(another_new_strat.manufacturer_count).to eq(2)
      expect(another_new_paul.manufacturer_count).to eq(1)
    end

    it '#make_cost_readable' do
      project = Project.create!(name: "NAMM 2023", manager: "James Harkins")
      another_new_strat = project.items.create!(name: "The Newest Strat", cost: 1500)

      expect(another_new_strat.make_cost_readable).to eq(1500.00)
    end
  end
end
