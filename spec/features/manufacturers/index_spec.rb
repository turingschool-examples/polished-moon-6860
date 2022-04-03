require 'rails_helper'

RSpec.describe 'manufacturers index page' do
  it 'displays a list of names of all the manufacturers' do
    project_1 = Project.create!(name: 'New Summer Toy', manager: 'John Doe')
    item_1 = project_1.items.create!(name: 'Ball', cost: 5)
    item_2 = project_1.items.create!(name: 'Game', cost: 10)
    item_3 = project_1.items.create!(name: 'Toy car', cost: 13)
    item_4 = project_1.items.create!(name: 'Nerf', cost: 23)
    item_5 = project_1.items.create!(name: 'Board game', cost: 15)
    usa_supply_1 = item_1.manufacturers.create(name: 'Toy Supply Co', location: 'USA')
    usa_supply_2 = item_2.manufacturers.create(name: 'Toy Supply Co', location: 'USA')
    uk_supply_1 = item_3.manufacturers.create(name: 'Game Supply Co', location: 'UK')
    uk_supply_2 = item_4.manufacturers.create(name: 'Game Supply Co', location: 'UK')
    ca_supply = item_5.manufacturers.create(name: 'Art Supply Co', location: 'CA')
    visit '/manufacturers'
    expect(page).to have_content(usa_supply_1.name)
    expect(page.text.index('Toy Supply Co')).to be < page.text.index('Ball')
    expect(page.text.index('Ball')).to be < page.text.index('Game')

    expect(page).to have_content(uk_supply_1.name)
    expect(page.text.index('Game Supply Co')).to be < page.text.index('Toy car')
    expect(page.text.index('Toy car')).to be < page.text.index('Nerf')

    expect(page).to have_content(ca_supply.name)
    expect(page.text.index('Game Supply Co')).to be < page.text.index('Toy car')
    expect(page.text.index('Art Supply Co')).to be < page.text.index('Board game')
  end
end
