require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :manager }
  end

  describe 'relationships' do
    it { should have_many :items }
  end

  describe 'instance methods' do
    it '#average_cost_per_item' do
      project = Project.create!(name: "NAMM 2023", manager: "James Harkins")

      fender = Manufacturer.create!(name: "Fender", location: "Los Angeles")
      another_new_strat = fender.items.create!(name: "The Newest Strat", cost: 1507, project_id: project.id)
      another_new_tele = fender.items.create!(name: "The Newest Tele", cost: 1302, project_id: project.id)

      gibson = Manufacturer.create!(name: "Gibson", location: "Nashville")
      another_new_paul = gibson.items.create!(name: "The Newest Les Paul", cost: 2501, project_id: project.id)
      another_new_sg = gibson.items.create!(name: "The Newest SG", cost: 2009, project_id: project.id)
      another_new_v = gibson.items.create!(name: "The Newest Flying V", cost: 2502, project_id: project.id)

      expect(project.average_cost_per_item).to eq(1964.2)
    end

    it 'can convert the average to readable currency' do
      project = Project.create!(name: "NAMM 2023", manager: "James Harkins")

      fender = Manufacturer.create!(name: "Fender", location: "Los Angeles")
      another_new_strat = fender.items.create!(name: "The Newest Strat", cost: 1507, project_id: project.id)
      another_new_tele = fender.items.create!(name: "The Newest Tele", cost: 1302, project_id: project.id)

      gibson = Manufacturer.create!(name: "Gibson", location: "Nashville")
      another_new_paul = gibson.items.create!(name: "The Newest Les Paul", cost: 2501, project_id: project.id)
      another_new_sg = gibson.items.create!(name: "The Newest SG", cost: 2009, project_id: project.id)
      another_new_v = gibson.items.create!(name: "The Newest Flying V", cost: 2502, project_id: project.id)

      expect(project.make_average_readable).to eq("$1964.20")
    end
  end
end
