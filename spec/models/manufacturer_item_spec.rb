require 'rails_helper'

RSpec.describe ManufacturerItem, type: :model do

  describe 'relationships' do
    it { should belong_to(:manufacturer)}
    it { should belong_to(:item)}
  end

end
