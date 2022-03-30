require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
  end

  describe 'relationships' do
    it { should have_many :manufacturer_items }
    it { should have_many(:items).through(:manufacturer_items) }
  end
    
end