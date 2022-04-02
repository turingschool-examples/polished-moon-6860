class Project < ApplicationRecord
  validates_presence_of :name, :manager
  has_many :items

  def average_cost_per_item
    items.average(:cost)
  end
end
