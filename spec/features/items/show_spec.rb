require 'rails_helper'

RSpec.describe 'item show page' do
  describe 'as a visitor' do
    describe 'when i visit an items show page' do
      before :each do
        @project = Project.create!(name: "NAMM 2023", manager: "James Harkins")
        @another_new_strat = @project.items.create!(name: "The Newest Strat", cost: 1500)
        @another_new_paul = @project.items.create!(name: "The Newest Paul", cost: 2500)
        @fender = @another_new_strat.manufacturers.create!(name: "Fender Guitars", location: "Los Angeles")
        @ernie_ball = @another_new_strat.manufacturers.create!(name: "Ernie Ball Strings", location: "San Luis Obispo")
        @gibson = @another_new_paul.manufacturers.create!(name: "Gibson", location: "Nashville")
        @daddario = Manufacturer.create!(name: "Daddario", location: "Los Angeles")

        visit "/items/#{@another_new_strat.id}"
      end

      it 'i see that items name and cost' do
        expect(page).to have_content("#{@another_new_strat.name}")
        expect(page).to have_content("Cost: $1500.00")
        expect(page).not_to have_content("#{@another_new_paul.name}")
        expect(page).not_to have_content("Cost: #{@another_new_paul.cost}")
      end

      it 'i see the name of the project the item belongs to' do
        expect(page).to have_content("Project: #{@project.name}")
      end

      it 'i see a count of the number of manufacturers for the item' do
        expect(page).to have_content("Manufacturer Count: 2")
      end

      it 'i see a form to add a manufacturer to the item' do
        fill_in "New manufacturer", with: "#{@daddario.id}"

        click_on "Add Manufacturer to this Item"

        expect(current_path).to eq("/items/#{@another_new_strat.id}")

        expect(page).to have_content("Manufacturer Count: 3")
      end
    end
  end
end
