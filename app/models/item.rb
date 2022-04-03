class Item < ApplicationRecord
  validates_presence_of :name, :cost
  belongs_to :project
  has_many :manufacturer_items
  has_many :manufacturers, through: :manufacturer_items

  def item_made_by_manufacturers
    manufacturers.count
  end
end
