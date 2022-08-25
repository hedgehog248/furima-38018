require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の新規登録' do
    context '保存できるとき' do
      it 'image, name, explanation, price, category, condition, delivery_fee_payer, area, days_to_ship, userが正しく存在するとき保存できる' do
        expect(@item).to be_valid
      end
    end
    context '保存できないとき' do
      it 'imageが空だと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空だと保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'explanationが空だと保存できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'priceが空だと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300以下だと保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceが10,000,000以上だと保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than 10000000'
      end
      it 'priceが全角文字だと保存できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが半角英字だと保存できない' do
        @item.price = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'categoryが空だと保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'categoryが未選択(=1)だと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'conditionが空だと保存できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'conditionが未選択(=1)だと保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'delivery_fee_payerが空だと保存できない' do
        @item.delivery_fee_payer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee payer can't be blank"
      end
      it 'delivery_fee_payerが未選択(=1)だと保存できない' do
        @item.delivery_fee_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee payer can't be blank"
      end
      it 'areaが空だと保存できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it 'areaが未選択(=1)だと保存できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it 'days_to_shipが空だと保存できない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end
      it 'days_to_shipが未選択(=1)だと保存できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
