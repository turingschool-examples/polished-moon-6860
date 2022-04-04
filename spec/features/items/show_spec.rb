require 'rails_helper'

RSpec.describe 'Items show page' do

  describe 'As a visitor' do

    it 'I see the items name and cost, and name of project it belongs to' do

      fence = Project.create!(name: 'New Fence Project', manager: 'Skeeter')
      hammer = fence.items.create!(name: 'Big Ole Hammer', cost: 55)

      visit "/items/#{hammer.id}"
      save_and_open_page
      expect(page).to have_content("Name: #{hammer.name}")
      expect(page).to have_content("Cost: #{hammer.cost}")
      expect(page).to have_content("Project: #{fence.name}")



    end





  end







end
