class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}, allow_blank: true
  validates :price, presence: true
  
  validates :image, presence: true
end

