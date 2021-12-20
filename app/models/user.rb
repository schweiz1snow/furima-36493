class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :items
  # has_many :buyers

  validates :nickname, presence: true
  validates :email, presence: true
  validates :encrypted_password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "6文字以上半角英数字"}
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "お名前は全角日本語"}
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "お名前は全角日本語"}
  validates :first_name_kana, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "お名前（カナ）は全角カタカナ"}
  validates :last_name_kana, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "お名前（カナ）は全角カタカナ"}
  validates :birth_date, presence: true
  
end
