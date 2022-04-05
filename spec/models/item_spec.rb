require "rails_helper"

RSpec.describe Item, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cost }
  end

  describe "relationships" do
    it { should belong_to :project }
    it { should have_many :manufacturer_items }
    it { should have_many(:manufacturers).through(:manufacturer_items) }
  end

  describe "#manufacturer_count" do
    it "returns the number of manufacturers for a given item" do
      project1 = Project.create!(name: "New Tech", manager: "Mike Dao")
      item1 = Item.create!(name: "Laptop", cost: 250, project_id: project1.id)
      manufacturer1 = item1.manufacturers.create!(name: "Widget Maker", location: "Phoenix")
      manufacturer2 = item1.manufacturers.create!(name: "Gear Heads", location: "Sacramento")
      manufacturer3 = item1.manufacturers.create!(name: "Weavers", location: "Chicago")

      expect(item1.manufacturer_count).to eq(3)
    end
  end
end
