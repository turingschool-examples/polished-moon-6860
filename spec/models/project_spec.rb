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
    describe '#average_cost_per_item' do
      it "averages the cost of all items to two decimal places" do
        project = Project.create!(name: "Pencil Project", manager: "Billy")
        pencil = project.items.create!(name: "Pencil", cost: "50")
        eraser = project.items.create!(name: "Eraser", cost: "25")
        ink_pen = project.items.create!(name: "Ink Pen", cost: "100")
        expect(project.average_cost_per_item).to eq(58.33)
      end
    end
  end
end
