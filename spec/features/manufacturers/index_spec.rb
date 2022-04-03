require 'rails_helper'

RSpec.describe 'Manufacturers#index page' do
  before :each do
    @project = Project.create!(name: "Create Life", manager: "Dr. Frankenstein")

    @lab = Manufacturer.create!(name: "Frankenstein's Lab", location: "Ingolstadt, Germany")
    @table = @lab.items.create!(name: "Steel Lab Table", cost: 500, project_id: @project.id)
    @roof = @lab.items.create!(name: "Retractable Roof", cost: 10000, project_id: @project.id)

    @graveyard = Manufacturer.create!(name: "Ingolstadt Graveyard", location: "Ingolstadt, Germany")
    @limbs = @graveyard.items.create!(name: "Some Limbs", cost: 0, project_id: @project.id)
    @head = @graveyard.items.create!(name: "A head", cost: 0, project_id: @project.id)
    @torso = @graveyard.items.create!(name: "A torso", cost: 0, project_id: @project.id)

    visit '/manufacturers'
  end

  it 'should list the names of the manufacturers' do
    expect(page).to have_content(@lab.name)
    expect(page).to have_content(@graveyard.name)
  end

  it 'should list the manufacturer items under each name' do
    within "#manufacturer-#{@lab.id}" do
      expect(page).to have_content(@table.name)
      expect(page).to have_content(@roof.name)
    end

    within "#manufacturer-#{@graveyard.id}" do
      expect(page).to have_content(@limbs.name)
      expect(page).to have_content(@head.name)
      expect(page).to have_content(@torso.name)
    end
  end
end
