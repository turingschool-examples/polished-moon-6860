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

  let!(:estuff) { Project.create!(name: "eStuff", manager: "Jim Cook") }
  let!(:ephone) { Item.create!(name: "ePhone", cost: 900, project_id: estuff.id) }
  let!(:fexcamm) { Manufacturer.create!(name: "FexCamm", location: "Wisconsin") }
  let!(:tegatron) { Manufacturer.create!(name: "Tegatron", location: "Taiwan") }
  let!(:man_item_1) { ManufacturerItem.create!(item_id: ephone.id, manufacturer_id: fexcamm.id) }
  let!(:man_item_2) { ManufacturerItem.create!(item_id: ephone.id, manufacturer_id: tegatron.id) }

  it "returns count of manufacturers" do
    expect(ephone.manufacturer_count).to eq(2)
  end
end
