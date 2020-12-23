# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
|encrypted_password| string | null: false |
| first_name_kana  | string | null: false |add_column
| last_name_kana   | string | null: false |add_column
| name_reading     | string | null: false |
| birth_date       | date   | null: false |

### Association
- has_many :items
- has_many :orders



## items テーブル

|Column     | Type     | Options      |
| --------- | -------- | ------------ |
| name      |  string  | null: false  |
| text      |  text    | null: false  |
| price     | integer  | null: false  |
|Category_id| integer  | null: false  |
|Status_id  | integer  | null: false  |

### Association
- belongs_to : user
- belongs_to : order

## orders テーブル

| Column      | Type       | Options                        |
| --------    | ---------- | ------------------------------ |
| user        |references  | null: false, foreign_key: true |
| item        |references  | null: false, foreign_key: true |


### Association
- belongs_to : user
- has_many : items
- has_one : address

## address テーブル

| Column                     | Type       | Options                        |
| -------------------------- | -------    | -----------------------------  |
| postal_code (郵便番号)     | string     | null: false                    |
| prefecture  (都道府県)     | integer    | null: false                    |
|city (市町村)               | string     | null: false                    |
|house_number(丁目、番地、号)| string     | null: false                    |
|building_name(建物名)       | string     | null: false                    |
|phone_number (電話番号)     | string     | null: false                    |

### Association
- belongs_to :order