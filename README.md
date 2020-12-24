# テーブル設計

## users テーブル

| Column           | Type   | Options                   |
| ---------------- | ------ | ------------------------- |
| nickname         | string | null: false               |
| email            | string | null: false unique: true  |
|encrypted_password| string | null: false               |
| first_name       | string | null: false               |
| last_name        | string | null: false               |
| first_name_kana  | string | null: false               |
| last_name_kana   | string | null: false               |
| birth_date       | date   | null: false               |

### Association
- has_many :items
- has_many :orders



## items テーブル

|Column               | Type     | Options                         |
| ---------------     | -------- | ------------------------------- |
| name                |  string  | null: false                     |
| text                |  text    | null: false                     |
| price               | integer  | null: false                     |
|category_id          | integer  | null: false                     |
|status_id            | integer  | null: false                     |
|shipping_fee_id      | integer  | null: false                     |
|prefecture_id        | integer  | null: false                     |
|scheduled_delivery_id| integer  | null: false                     |
|user                 |references| null: false, foreign_key: true  |

### Association
- belongs_to : user
- has_one :order

## orders テーブル

| Column      | Type       | Options                        |
| --------    | ---------- | ------------------------------ |
| user        |references  | null: false, foreign_key: true |
| item        |references  | null: false, foreign_key: true |


### Association
- belongs_to : user
- belongs_to : item
- has_one : address

## address テーブル

| Column                     | Type       | Options                        |
| -------------------------- | -------    | -----------------------------  |
| postal_code (郵便番号)     | string     | null: false                    |
| prefecture_id (都道府県)   | integer    | null: false                    |
|city (市町村)               | string     | null: false                    |
|house_number(丁目、番地、号)| string     | null: false                    |
|building_name(建物名)       | string     |                                |
|phone_number (電話番号)     | string     | null: false                    |
|order                       |references  | null: false, foreign_key: true |

### Association
- belongs_to :order