class Project < ApplicationRecord
  validates_presence_of :name, :manager
  has_many :items
end