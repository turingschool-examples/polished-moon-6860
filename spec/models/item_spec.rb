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
  
  it "counts the number of manufacturers" do
    project = Project.create!(name: 'newbuild', manager: 'Rick')
    item1 = Item.create!(name: 'thingamabob', cost: 12, project_id:"#{project.id}")
    item2 = Item.create!(name: 'rattle', cost: 76, project_id:"#{project.id}")
    
    manufacturer1 = item1.manufacturers.create!(name: 'ABC corp', location: "Nevada")
    manufacturer2 = item1.manufacturers.create!(name: 'Apple', location: "Cali")
    manufacturer3 = item2.manufacturers.create!(name: 'Tickle Me', location: "New Foundland")
    require "pry"; binding.pry
    expect(item1.num_manufacturers).to eq(2)
    expect(item2.num_manufacturers).to eq(1)
    
  end
end
