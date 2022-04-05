class Manufactureritem < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :item
end
