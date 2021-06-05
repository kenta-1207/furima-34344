class Purchase < ApplicationRecord
  has_one :shipping_addresse
  belongs_to :user
  belongs_to :item
end
