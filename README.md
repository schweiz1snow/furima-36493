# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :buyer
- has_many :shipping_address

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | string     | null: false                    |
| item_name          | string     | null: false                    |
| explain            | text       | null: false                    |
| detail             | string     | null: false                    |
| ship               | string     | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| buyer              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :shipping_address
- belongs_to :buyer

## buyers テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_number        | string     | null: false                    |
| deadline           | string     | null: false                    |
| security_code      | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :shipping_address

## shipping_address テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| address_code       | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| town_number        | string     | null: false                    |
| building           | string     | null: false                    |
| phone_number       | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| buyer              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buyer