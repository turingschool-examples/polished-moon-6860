class ManufacturerItem < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :item
end
