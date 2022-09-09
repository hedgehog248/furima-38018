require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      @order_shipping_address = FactoryBot.build(:order_shipping_address, item_id: item.id, user_id: item.user_id)
      sleep 0.1
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_shipping_address).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_shipping_address.building = ''
        expect(@order_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @order_shipping_address.postal_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeに半角ハイフンが正しい位置になければ保存できない' do
        @order_shipping_address.postal_code = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'postal_codeが全角では保存できない' do
        @order_shipping_address.postal_code = '１２３ー４５６７'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'area_idが空だと保存できない' do
        @order_shipping_address.area_id = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Area can't be blank"
      end
      it 'area_idが未選択(=1)では保存できない' do
        @order_shipping_address.area_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Area can't be blank"
      end
      it 'cityが空だと保存できない' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空だと保存できない' do
        @order_shipping_address.address = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Address can't be blank"
      end
      it 'telが空だと保存できない' do
        @order_shipping_address.tel = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Tel can't be blank"
      end
      it 'telが9桁以下だと保存できない' do
        @order_shipping_address.tel = '01234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Tel is invalid. Don't include hyphen(-)"
      end
      it 'telが12桁以上だと保存できない' do
        @order_shipping_address.tel = '012345678901'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Tel is invalid. Don't include hyphen(-)"
      end
      it 'telが全角だと保存できない' do
        @order_shipping_address.tel = '０１２３４５６７８９０'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Tel is invalid. Don't include hyphen(-)"
      end
      it 'userが紐付いていないと保存できない' do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐付いていないと保存できない' do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Item can't be blank"
      end
      it 'tokenが空だと保存できない' do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
