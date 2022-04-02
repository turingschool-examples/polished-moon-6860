require 'rails_helper'

RSpec.describe 'project show page' do
  describe 'as a visitor' do
    describe 'when i visit a project show page' do
      it 'i see the average cost per item for that projects items rounded to two decimal places' do
        project = Project.create!(name: "NAMM 2023", manager: "James Harkins")

        fender = Manufacturer.create!(name: "Fender", location: "Los Angeles")
        another_new_strat = fender.items.create!(name: "The Newest Strat", cost: 1507.5, project_id: project.id)
        another_new_tele = fender.items.create!(name: "The Newest Tele", cost: 1302.2, project_id: project.id)

        gibson = Manufacturer.create!(name: "Gibson", location: "Nashville")
        another_new_paul = gibson.items.create!(name: "The Newest Les Paul", cost: 2501.5, project_id: project.id)
        another_new_sg = gibson.items.create!(name: "The Newest SG", cost: 2009.5, project_id: project.id)
        another_new_v = gibson.items.create!(name: "The Newest Flying V", cost: 2502.5, project_id: project.id)

        visit "/projects/#{project.id}"

        expect(page).to have_content("Average Cost Per Item: $1964.64")
      end

      it 'the average still looks like currency for more even numbers' do
        project = Project.create!(name: "NAMM 2023", manager: "James Harkins")

        fender = Manufacturer.create!(name: "Fender", location: "Los Angeles")
        another_new_strat = fender.items.create!(name: "The Newest Strat", cost: 1507, project_id: project.id)
        another_new_tele = fender.items.create!(name: "The Newest Tele", cost: 1302, project_id: project.id)

        gibson = Manufacturer.create!(name: "Gibson", location: "Nashville")
        another_new_paul = gibson.items.create!(name: "The Newest Les Paul", cost: 2501, project_id: project.id)
        another_new_sg = gibson.items.create!(name: "The Newest SG", cost: 2009, project_id: project.id)
        another_new_v = gibson.items.create!(name: "The Newest Flying V", cost: 2502, project_id: project.id)

        visit "/projects/#{project.id}"

        expect(page).to have_content("Average Cost Per Item: $1964.20")
      end
    end
  end
end
