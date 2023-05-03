# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encryptedPassword  | string | null: false               |
| familyName         | string | null: false               |
| firstName          | string | null: false               |
| familyNameKana     | string | null: false               |
| firstNameKana      | string | null: false               |
| dateOfBirth        | string | null: false               |


### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | string     | null: false                    |
| productName        | string     | null: false                    |(商品名)
| explanation        | text       | null: false                    |(商品の説明)
| category           | string     | null: false                    |
| commodityCondition | text       | null: false                    |(状態)
| shippingCharges    | string     | null: false                    |(送料負担)
| shippingOrigins    | string     | null: false                    |(配送元)
| deliveryDate       | string     | null: false                    |(配送までの日数)
| price              | string     | null: false                    |(価格)
| seller_user        | references | null: false, foreign_key: true |(出品者)
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase



## purchases テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| buyer_user | references | null: false, foreign_key: true |(購入者)
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :delivery



## deliveries テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| postCode        | string | null: false |(郵便番号)
| prefectures     | string | null: false |(都道府県)
| city            | string | null: false |(市町村)
| address         | string | null: false |(番地)
| buildingName    | text   | null: false |(建物名)
| telephoneNumber | string | null: false |(電話番号)

### Association

- belongs_to :purchase