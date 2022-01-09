class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :buyers

  validates :nickname, presence: true
  validates :password, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "半角英数字混合"}
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々ー]/, message: "お名前は全角日本語"}
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々ー]/, message: "お名前は全角日本語"}
  validates :first_name_kana, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "お名前（カナ）は全角カタカナ"}
  validates :last_name_kana, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "お名前（カナ）は全角カタカナ"}
  validates :birth_date, presence: true
  
end
