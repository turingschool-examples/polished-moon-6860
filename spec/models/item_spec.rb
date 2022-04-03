require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cost }
  end

  describe 'relationships' do
    it { should belong_to :project }
    it { should have_many :manufacturer_items }
    it { should have_many(:manufacturers).through(:manufacturer_items) }
  end

  it "counts manufacturers associated with item" do
    project = Project.create!(name: "Eat Road Runner", manager: "Wile E. Coyote")
    item_1 = project.items.create!(name: "Anvil", cost: 200)
    item_2 = project.items.create!(name: "Trampoline", cost: 800)

    acme = Manufacturer.create!(name: "ACME", location: "Toonville USA")
    offbrand = Manufacturer.create!(name: "Offbrand ACME", location: "Worseville USA")

    item_1.manufacturers << acme
    item_2.manufacturers << acme
    item_2.manufacturers << offbrand

    expect(item_1.manufacturer_count).to eq(1)
    expect(item_2.manufacturer_count).to eq(2)
  end
end
