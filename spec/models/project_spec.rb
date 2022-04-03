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
    before :each do
      @project = Project.create!(name: "Create Life", manager: "Dr. Frankenstein")

      @lab = Manufacturer.create!(name: "Frankenstein's Lab", location: "Ingolstadt, Germany")
      @table = @lab.items.create!(name: "Steel Lab Table", cost: 523.64, project_id: @project.id)
      @roof = @lab.items.create!(name: "Retractable Roof", cost: 10054.55, project_id: @project.id)

      @graveyard = Manufacturer.create!(name: "Ingolstadt Graveyard", location: "Ingolstadt, Germany")
      @limbs = @graveyard.items.create!(name: "Some Limbs", cost: 18.46, project_id: @project.id)
      @head = @graveyard.items.create!(name: "A head", cost: 17.33, project_id: @project.id)
      @torso = @graveyard.items.create!(name: "A torso", cost: 23.65, project_id: @project.id)
    end

    it '#average_price should return the average price per item' do
      expect(@project.average_price).to eq(2127.53)
    end
  end
end
