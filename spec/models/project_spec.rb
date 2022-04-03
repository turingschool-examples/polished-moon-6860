require "rails_helper"

RSpec.describe Project, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :manager }
  end

  describe "relationships" do
    it { should have_many :items }
  end

  let!(:estuff) { Project.create!(name: "eStuff", manager: "Jim Cook") }
  let!(:ephone) { Item.create!(name: "ePhone", cost: 900, project_id: estuff.id) }
  let!(:epad) { Item.create!(name: "ePad", cost: 400, project_id: estuff.id) }

  it "averages cost of all associated items" do
    expect(estuff.average_item_cost).to eq(650)
  end
end
