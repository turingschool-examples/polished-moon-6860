class Project < ApplicationRecord
  validates_presence_of :name, :manager
  has_many :items

  def average_price
    (items.sum(:cost) / items.count).round(2)
  end
end
