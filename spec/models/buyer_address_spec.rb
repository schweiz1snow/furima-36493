require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
      sleep 0.1 # 0.1秒待機
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@buyer_address).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @buyer_address.prefecture_id = 0
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityは空だと保存できない' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberは空だと保存できない' do
        @buyer_address.house_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @buyer_address.phone_number = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下では購入できない' do
        @buyer_address.phone_number = '123456789'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end
      it '電話番号が12桁以上では購入できない' do
        @buyer_address.phone_number = '123456789012'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @buyer_address.phone_number = '080１０１０１０１０'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number is invalid. Input half-width characters.')
      end
      it 'userが紐付いていなければ購入できない' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'クレジットカード情報に不備があれば（＝トークンが空であれば）保存できない' do
        @buyer_address.token = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end