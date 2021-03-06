class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    # ひらがな、カタカナ、漢字のみ許可する
    validates :city, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    # 数字のみ許可する
    validates :phone_number, length: { minimum: 10, maximum: 11}, format: {with: /\A[0-9]+\z/i, message: "is invalid. Input half-width characters."}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :house_number
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    # 購入者情報を保存し、変数buyerに代入する
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    # 配送先を保存する
    # buyer_idには、変数buyerのidと指定する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end

end