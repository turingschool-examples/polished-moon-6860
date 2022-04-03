require "rails_helper"

RSpec.describe "items show" do
  before :each do
    @project = Project.create!(name: "Eat Road Runner", manager: "Wile E. Coyote")
    @item_1 = @project.items.create!(name: "Anvil", cost: 200)
  end

  it "shows item name and cost" do
    visit "/items/#{@item_1.id}"
    # save_and_open_page
    expect(page).to have_content("Anvil")
    expect(page).to have_content("200")
    expect(page).to have_content("Eat Road Runner")
  end
end
