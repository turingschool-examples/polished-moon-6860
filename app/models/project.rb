class Project < ApplicationRecord
  validates_presence_of :name, :manager
  has_many :items

  def average_cost_per_item
    avg = (items.map {|item| item.cost}.sum) / items.count.to_f
    avg.round(2)
  end
end
