require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do
    it '商品名が空では出品できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Item name can't be blank"
    end
    it '商品説明が空では出品できない' do
      @item.explain = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Explain can't be blank"
    end

    it 'カテゴリー選択をしなければ出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it '商品の状態を選択をしなければ出品できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end
    it '配送料の負担を選択をしなければ出品できない' do
      @item.payer_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Payer can't be blank"
    end
    it '発送元の地域を選択をしなければ出品できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture can't be blank"
    end
    it '発送までの日数を選択をしなければ出品できない' do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping day can't be blank"
    end
    it '価格が空では出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
  end
end
