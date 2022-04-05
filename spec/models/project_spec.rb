require "rails_helper"

RSpec.describe Project, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :manager }
  end

  describe "relationships" do
    it { should have_many :items }
  end

  it "calculates average cost per item to two decimal places" do
    wood_floor = Project.create!(name: "floor repair", manager: "Gary")
    sander = wood_floor.items.create!(name: "sander", cost: 412.16)
    varnish = wood_floor.items.create!(name: "varnish", cost: 102.45)

    expect(wood_floor.average_item_cost).to eq(257.00)
  end
end
