class ManufacturerItem < ActiveRecord::Base
  belongs_to :manufacturer
  belongs_to :item

end
