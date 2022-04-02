class Item < ApplicationRecord
  validates_presence_of :name, :cost
  belongs_to :project
  has_many :manufacturer_items
  has_many :manufacturers, through: :manufacturer_items

  def manufacturer_count
    manufacturers.count
  end

  def make_cost_readable
    currency_cost = "%.2f" % cost.truncate(2)
    "$#{currency_cost}"
  end
end
