# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| date_year          | string | null: false               |
| date_month         | string | null: false               |
| date_day           | string | null: false               |


### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |(商品名)
| explanation         | text       | null: false                    |(商品の説明)
| category            | integer    | null: false                    |
| commodity_condition | integer    | null: false                    |(状態)
| shipping_charges    | integer    | null: false                    |(送料負担)
| shipping_origins    | integer    | null: false                    |(配送元)
| delivery_date       | integer    | null: false                    |(配送までの日数)
| price               | integer    | null: false                    |(価格)
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase



## purchases テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :delivery



## deliveries テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| post_code        | string  | null: false |(郵便番号)
| prefecture       | integer | null: false |(都道府県)
| city             | string  | null: false |(市町村)
| address          | string  | null: false |(番地)
| building_name    | text    |             |(建物名)
| telephone_number | string  | null: false |(電話番号)

### Association

- belongs_to :purchase