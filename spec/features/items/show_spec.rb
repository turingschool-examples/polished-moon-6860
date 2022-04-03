# As a visitor,
# When I visit an item's show page ("/items/:id"),
# I see that item's name and cost
# And I also see the name of the project this belongs to.
require 'rails_helper'

RSpec.describe 'when i visit an items show page'do

  before do
    @item_1 =

  visit "/items/#{@item_1.id}"
  end

  describe 'display' do
    it 'item name, cost and project item belongs to' do

    end
  end
end
