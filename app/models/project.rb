class Project < ApplicationRecord
  validates_presence_of :name, :manager
  has_many :items

   def average_item_cost
     require "pry"; binding.pry
     items.average.item[:cost]
   end
end