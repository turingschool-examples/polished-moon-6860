class Project < ApplicationRecord
  validates_presence_of :name, :manager
  has_many :items

  def average_item_cost
    costs_array = items.map { |item| item.cost  }
    (costs_array.sum(0.00) / costs_array.count).round(2)
  end
end
