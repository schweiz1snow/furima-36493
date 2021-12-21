require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    # 正常系
    it '全ての項目が入力されていれば登録できる' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
    # 異常系
    # nickname
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include "Nickname can't be blank"
    end
    # email
    it 'メールアドレスが空では登録できない' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したメールアドレスは登録できない' do
      @user = FactoryBot.build(:user)
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスに@を含まない場合は登録できない' do
      user = FactoryBot.build(:user)
      user.email = 'shishi.shishi'
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end
    # password
    it 'パスワードが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードが6文字未満では登録できない' do
      user = FactoryBot.build(:user)
      user.password = '1pipo'
      user.password_confirmation = '1pipo'
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it '英字のみのパスワードでは登録できない' do
      user = FactoryBot.build(:user)
      user.password = 'aaaaaa'
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '数字のみのパスワードでは登録できない' do
      user = FactoryBot.build(:user)
      user.password = '111111'
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '全角文字を含むパスワードでは登録できない' do
      user = FactoryBot.build(:user)
      user.password = 'ああああああ'
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
      user = FactoryBot.build(:user)
      user.password = '1pipo1'
      user.password_confirmation = '2pipo2'
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    # 姓、名（全角）
    it '姓（全角）が空だと登録できない' do
      user = FactoryBot.build(:user)
      user.last_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name お名前は全角日本語")
    end
    it '姓（全角）に半角文字が含まれていると登録できない' do
      user = FactoryBot.build(:user)
      user.last_name = 'ｼﾓﾀﾞ'
      user.valid?
      expect(user.errors.full_messages).to include("Last name お名前は全角日本語")
    end
    it '名（全角）が空だと登録できない' do
      user = FactoryBot.build(:user)
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name お名前は全角日本語")
    end
    it '名（全角）に半角文字が含まれていると登録できない' do
      user = FactoryBot.build(:user)
      user.first_name = 'ｶｹﾞｷ'
      user.valid?
      expect(user.errors.full_messages).to include("First name お名前は全角日本語")
    end
    # 姓、名（全角カナ）
    it '姓（カナ）が空だと登録できない' do
      user = FactoryBot.build(:user)
      user.last_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name お名前は全角日本語")
    end
    it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      user = FactoryBot.build(:user)
      user.last_name_kana = '影姫かげき-1one'
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana お名前（カナ）は全角カタカナ")
    end
    it '名（カナ）が空だと登録できない' do
      user = FactoryBot.build(:user)
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name お名前は全角日本語")
    end
    it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
      user = FactoryBot.build(:user)
      user.first_name_kana = '影姫かげき-1one'
      user.valid?
      expect(user.errors.full_messages).to include("First name kana お名前（カナ）は全角カタカナ")
    end
    # 生年月日
    it '生年月日が空だと登録できない' do
      user = FactoryBot.build(:user)
      user.birth_date = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end