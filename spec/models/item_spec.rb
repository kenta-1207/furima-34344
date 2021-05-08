require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の新規登録' do
    context '新規登録出来るとき' do

      it 'name, description, category_id, item_status_id, delivery_charge_id, prefecture_id, shipping_day_id, price, imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end

      it 'priceが半角数字なら登録できる' do
        @item.price = '1111'
        expect(@item).to be_valid
      end

      it 'priceが300~9999999なら登録できる' do
        @item.price = '1111'
        expect(@item).to be_valid
      end

    end

    context '新規登録出来ないとき' do

      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'category_idが1では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'item_status_idが1では登録できない' do
        @item.item_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 1")
      end

      it 'delivery_charge_idが1では登録できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
      end

      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'shipping_idが1では登録できない' do
        @item.shipping_day_id ='1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end

      it 'priceが300以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it 'priceが10000000以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end
  end
end
