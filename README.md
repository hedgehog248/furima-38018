# データベース設計
___
## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| family_name        | string | null: false |
| last_name          | string | null: false |
| family_name_kana   | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :orders

___
## items テーブル
| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| name                  | string     | null: false |
| category_id           | integer    | null: false |
| condition_id          | integer    | null: false |
| price                 | integer    | null: false |
| delivery_fee          | integer    | null: false |
| delivery_fee_payer_id | integer    | null: false |
| area_id               | integer    | null: false |
| days_to_ship_id       | integer    | null: false |
| user　　               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :order

___
## orders テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association
- belongs_to :item_id
- belongs_to :user_id
- has_one    :shipping_address

___
## shipping_addresses テーブル 
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| code          | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address_1     | string     | null: false                    |
| address_2     | string     |                                |
| tel           | integer    | null: false                    |
| order_id      | references | null: false, foreign_key: true |

### Association
- belongs_to :order

