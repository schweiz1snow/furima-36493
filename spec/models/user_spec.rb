require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailには＠がないと登録できない' do
      user = FactoryBot.build(:user)
      user.email = 'testexample'
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it 'パスワードが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'kkk@gmail.com', password: '', password_confirmation: '0popopo')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
   end
   it 'パスワードが5文字以下だと登録できない' do
    user = User.new(nickname: 'test', email: 'kkk@gmail.com', password: '0po', password_confirmation: '0po')
    user.valid?
    expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
   end
   it 'パスワードとパスワード（確認）は一致しないと登録できない' do
    user = User.new(nickname: 'test', email: 'kkk@gmail.com', password: '0popopo', password_confirmation: '0pppppp')
    user.valid?
    expect(user.password == user.password_confirmation).to eq false
   end
  end
end
