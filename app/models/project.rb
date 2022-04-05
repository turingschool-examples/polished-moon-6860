class Project < ApplicationRecord
  validates_presence_of :name, :manager
  has_many :items

  def avg_item_price
    items.average(:cost)
  end
end
