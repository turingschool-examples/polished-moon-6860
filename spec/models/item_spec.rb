require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it { should belong_to :project }
    it { should have_many :manufacturer_items }
    it { should have_many(:manufacturers).through (:manufacturer_items)}
  end
end
