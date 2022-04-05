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

  it "counts manufacturers associated with item" do
    wood_floor = Project.create!(name: "floor repair", manager: "Gary")
    sander = wood_floor.items.create!(name: "sander", cost: 4)
    varnish = wood_floor.items.create!(name: "varnish", cost: 10)

    remodel = Manufacturer.create!(name: "Remodel", location: "Golden, CO")
    diy = Manufacturer.create!(name: "DIY Tools", location: "Arvada, CO")

    sander.manufacturers << remodel
    varnish.manufacturers << remodel
    varnish.manufacturers << diy

    expect(sander.manufacturer_count).to eq(1)
    expect(varnish.manufacturer_count).to eq(2)
  end
end
