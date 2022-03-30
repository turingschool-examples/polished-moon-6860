require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :manager }
  end

  describe 'relationships' do
    it { should have_many :items }
  end
end