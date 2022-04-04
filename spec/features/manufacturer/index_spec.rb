require 'rails_helper'

RSpec.describe 'manufacturers index' do
  before :each do
    @manufacturer1 = Manufacturer.create!(name: "Pabus shop", location: "Ferret land")
    @manufacturer2 = Manufacturer.create!(name: "Pabus warehouse", location: "Ferret factory")
    @project = Project.create!(name: "Pabus Ferret Shop", manager: "Pabu")
    @item1 = @manufacturer1.items.create!(name: "Shampoo", cost: 20, project_id: @project.id)
    @item2 = @manufacturer1.items.create!(name: "Brush", cost: 25, project_id: @project.id)
    @item3 = @manufacturer2.items.create!(name: "Chair", cost: 50, project_id: @project.id)
    @item4 = @manufacturer2.items.create!(name: "Sofa", cost: 100, project_id: @project.id)
    visit "/manufacturers"
  end

  describe 'manufacturers index page' do
    it 'shows items' do
      within("#manufacturers-1") do
        expect(page).to have_content(@manufacturers1.name)
        expect(page).to have_content(@item1.name)
        expect(page).to have_content(@item2.name)
        expect(page).to have_no_content(@item3.name)
        expect(page).to have_no_content(@item4.name)
      end
      within("#manufacturers-2") do
        expect(page).to have_content(@manufacturers2.name)
        expect(page).to have_content(@item3.name)
        expect(page).to have_content(@item4.name)
        expect(page).to have_no_content(@item1.name)
        expect(page).to have_no_content(@item2.name)
      end
    end
  end
end
