class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items, dependent: :destroy
  has_many :buyers, dependent: :destroy

  validates :nickname, presence: true
  validates :email, presence: true, format: { with: ^(?=.*@).*$}
  validates :encrypted_password, presence: true, format: { with: /^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}$/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヴー]+\z/u}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヴー]+\z/u}
  validates :birth_date, presence: true
  
end
