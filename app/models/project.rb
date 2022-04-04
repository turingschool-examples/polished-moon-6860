class Project < ApplicationRecord
  validates_presence_of :name, :manager
  has_many :items

  def average_cost
    items.average(:cost).to_d
  end
end
