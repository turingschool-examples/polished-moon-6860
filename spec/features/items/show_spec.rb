require 'rails_helper'

RSpec.describe 'Item show page' do

  before :each do 
    @project_1 = Project.create!(name: "Nicer Things", manager: "Kim G")
    @item_1 = @project_1.items.create!(name: "Nintendo Switch", cost: 349)
    @item_2 = @project_1.items.create!(name: "Lululemon Women's Golf Shirt", cost: 68)

  end
  it 'shows item name and cost' do 
    visit "/items/#{@item_1.id}"

    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_1.cost)
    expect(page).to have_content(@project_1.name)
  end

end