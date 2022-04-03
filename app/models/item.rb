class Item < ApplicationRecord
  validates_presence_of :name, :cost
  belongs_to :project
  has_many :manufacturer_items
  has_many :manufacturers, through: :manufacturer_items

  def manufacturer_count
    list = manufacturers.group(:manufacturer_id).count
    list.size
  end
end
