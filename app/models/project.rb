class Project < ApplicationRecord
  validates_presence_of :name, :manager
  has_many :items

  def average_item_cost
    self.items.average(:cost)
  end
end
