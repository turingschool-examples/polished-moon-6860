require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :manager }
  end

  describe 'relationships' do
    it { should have_many :items }
  end

  describe 'instance methods' do
    before (:each) do
      @project1 = Project.create!(name: "New House", manager: "Joe Smith")
      @project2 = Project.create!(name: "Ballpark", manager: "Fran Drescher")

      @item1 = @project1.items.create!(name: "Chair", cost: 34)
      @item2 = @project1.items.create!(name: "Bed frame", cost: 541)
      @item3 = @project1.items.create!(name: "Blackout curtains", cost: 65)
      @item4 = @project2.items.create!(name: "Field paint", cost: 50)
      @item5 = @project2.items.create!(name: "Chain fence", cost: 480)
      @item6 = @project2.items.create!(name: "Bleachers", cost: 750)
    end

    it '#avg_item_price' do
      expect(@project1.avg_item_price.to_f.round(2)).to eq(213.33)
      expect(@project2.avg_item_price.to_f.round(2)).to eq(426.67)
    end
  end

end
