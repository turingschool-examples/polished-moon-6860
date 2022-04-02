require 'rails_helper'

RSpec.describe 'item show page' do
  describe 'as a visitor' do
    describe 'when i visit an items show page' do
      before :each do
        project = Project.create!(name: "NAMM 2023", manager: "James Harkins")
        another_new_strat = project.items.create!(name: "The Newest Strat", cost: 1500)
        another_new_tele = project.items.create!(name: "The Newest Tele", cost: 1300)

        visit "/items/#{another_new_strat.id}"
      end

      it 'i see that items name and cost' do
        expect(page).to have_content("#{another_new_strat.name}")
        expect(page).to have_content("Cost: #{another_new_strat.cost}")
        expect(page).not_to have_content("#{another_new_tele.name}")
        expect(page).not_to have_content("Cost: #{another_new_tele.cost}")
      end

      it 'i also see the name of the project the item belongs to' do
        expect(page).to have_content("Project: #{project.name}")
      end
    end
  end
end
