require 'rails_helper'

RSpec.describe 'manufacturers index page' do
  describe 'as a visitor' do
    describe 'when i visit the manufacturers index page' do
      it 'i see a list of names of all the manufacturers' do
        project = Project.create!(name: "NAMM 2023", manager: "James Harkins")

        fender = Manufacturer.create!(name: "Fender", location: "Los Angeles")
        another_new_strat = fender.items.create!(name: "The Newest Strat", cost: 1500, project_id: project.id)
        another_new_tele = fender.items.create!(name: "The Newest Tele", cost: 1300, project_id: project.id)

        gibson = Manufacturer.create!(name: "Gibson", location: "Nashville")
        another_new_paul = gibson.items.create!(name: "The Newest Les Paul", cost: 2500, project_id: project.id)
        another_new_sg = gibson.items.create!(name: "The Newest SG", cost: 2000, project_id: project.id)
        another_new_v = gibson.items.create!(name: "The Newest Flying V", cost: 2500, project_id: project.id)

        visit '/manufacturers'

        within "#manufacturer-#{fender.id}" do
          expect(page).to have_content("#{fender.name}")
        end

        within "#manufacturer-#{gibson.id}" do
          expect(page).to have_content("#{gibson.name}")
        end
      end

      it 'i see a list of each manufacturers items underneath its name' do
        project = Project.create!(name: "NAMM 2023", manager: "James Harkins")

        fender = Manufacturer.create!(name: "Fender", location: "Los Angeles")
        another_new_strat = fender.items.create!(name: "The Newest Strat", cost: 1500, project_id: project.id)
        another_new_tele = fender.items.create!(name: "The Newest Tele", cost: 1300, project_id: project.id)

        gibson = Manufacturer.create!(name: "Gibson", location: "Nashville")
        another_new_paul = gibson.items.create!(name: "The Newest Les Paul", cost: 2500, project_id: project.id)
        another_new_sg = gibson.items.create!(name: "The Newest SG", cost: 2000, project_id: project.id)
        another_new_v = gibson.items.create!(name: "The Newest Flying V", cost: 2500, project_id: project.id)

        visit '/manufacturers'

        within "#manufacturer-#{fender.id}" do
          expect(page).to have_content("#{another_new_strat.name}")
          expect(page).to have_content("#{another_new_tele.name}")
        end

        within "#manufacturer-#{gibson.id}" do
          expect(page).to have_content("#{another_new_paul.name}")
          expect(page).to have_content("#{another_new_sg.name}")
          expect(page).to have_content("#{another_new_v.name}")
        end
      end
    end
  end
end
