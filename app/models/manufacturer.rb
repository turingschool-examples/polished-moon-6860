class Manufacturer < ApplicationRecord
  validates_presence_of :name, :location
  has_many :manufacturer_items
  has_many :items, through: :manufacturer_items

  #def find_items
  #  Item.joins(manufacturers: :manufacturer_items). where("manufacturers.id=#{self.id}")
  #end
end
