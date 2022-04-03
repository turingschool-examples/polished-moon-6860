require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :manager }
  end

  describe 'relationships' do
    it { should have_many :items }
  end

  it "calculates average cost per item to two decimal places" do
    project = Project.create!(name: "Eat Road Runner", manager: "Wile E. Coyote")
    item_1 = project.items.create!(name: "Anvil", cost: 200)
    item_2 = project.items.create!(name: "Trampoline", cost: 903)
    item_3 = project.items.create!(name: "Firecrackers", cost: 500)

    expect(project.average_item_cost).to eq(534.33)
  end
end
