require "rails_helper"

RSpec.describe "Projects Show page" do
  before :each do
    @project = Project.create!(name: "Eat Road Runner", manager: "Wile E. Coyote")
    @item_1 = @project.items.create!(name: "Anvil", cost: 200)
    @item_2 = @project.items.create!(name: "Trampoline", cost: 899.49)
  end

  it "shows average cost of items to two decimal places" do
    visit "/projects/#{@project_id}"

    expect(page).to have_content("Average Cost Per Item: 549.75")
  end
end
