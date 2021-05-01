class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :items_image
  end

  validates :price, presence: true format: {/\A[-]?[0-9]+(\.[0-9]+)?\z/}
end
