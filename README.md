# テーブル設計

## users テーブル

| Column             | Type   | Options                         |
| ------------------ | ------ | ------------------------------- |
| nickname           | string | null: false                     |
| email              | string | null: false, unique: true       |
| encrypted_password | string | null: false                     |
| first-name         | string | null: false                     |
| last-name          | string | null: false                     |
| first-name-kana    | string | null: false                     |
| last-name-kana     | string | null: false                     |
| birth-date         | date   | null: false                     |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item-name          | string     | null: false                    |
| explain            | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| payer_id           | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| shipping-day_id    | integer    | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| address-code       | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| town-number        | string     | null: false                    |
| building           | string     |                                |
| phone-number       | string     | null: false                    |
| buyer              | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer