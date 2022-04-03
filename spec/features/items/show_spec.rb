require "rails_helper"

RSpec.describe "items show" do
  before :each do
    @project = Project.create!(name: "Eat Road Runner", manager: "Wile E. Coyote")
    @item_1 = @project.items.create!(name: "Trampoline", cost: 200)
  end

  it "shows item name and cost" do
    visit "/items/#{@item_1.id}"

    expect(page).to have_content("Trampoline")
    expect(page).to have_content("200")
    expect(page).to have_content("Eat Road Runner")
  end
end
