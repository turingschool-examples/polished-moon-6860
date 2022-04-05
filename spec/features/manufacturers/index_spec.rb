require 'rails_helper'

RSpec.describe "manufacturers index" do
  before do
    @project1 = Project.create!(name: "Mine", manager: "Chris")
    @project2 = Project.create!(name: "Theirs", manager: "They/Them")
    @item1 = Item.create!(name: "CarTweet", cost: 30, project_id: @project1.id)
    @item2 = Item.create!(name: "WeWin", cost: 60, project_id: @project1.id)
    @item3 = Item.create!(name: "Plastic Things", cost: 1, project_id: @project2.id)
    @manufacturer1 = Manufacturer.create!(name: "Toy Makers", location: "Toledo")
    @manufacturer2 = Manufacturer.create!(name: "Stuff and Stuff", location: "China")
    ManufacturerItem.create!(manufacturer: @manufacturer1, item: @item1)
    ManufacturerItem.create!(manufacturer: @manufacturer2, item: @item3)
    ManufacturerItem.create!(manufacturer: @manufacturer1, item: @item2)
  end

  it 'can see alist of names of all manufacturers and the items they belong to' do

    visit '/manufacturers'

    save_and_open_page
    expect(page).to have_content(@manufacturer1.name)
    expect(page).to have_content(@item1.name)
    expect(page).to have_content(@item2.name)
    expect(page).to have_content(@item3.name)

  end
end
