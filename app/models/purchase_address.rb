class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipalities
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{10,11}+\z/}
    validates :user_id
    validates :item_id
    validates :token
  end

    VALID_POSTALCODE_REGEX = /\A\d{3}[-]\d{4}\z/
    validates :postal_code, format: {with: VALID_POSTALCODE_REGEX }, allow_blank: true

  def save

    purchase = Purchase.create(item_id: item_id, user_id: user_id)
   
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end