# データベース設計
___
## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :orders

___
## items テーブル
| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| name                  | string     | null: false |
| explanation           | text       | null: false |
| category_id           | integer    | null: false |
| condition_id          | integer    | null: false |
| price                 | integer    | null: false |
| delivery_fee_payer_id | integer    | null: false |
| area_id               | integer    | null: false |
| days_to_ship_id       | integer    | null: false |
| user                  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :order

___
## orders テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one    :shipping_address

___
## shipping_addresses テーブル 
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| area_id       | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| tel           | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to :order

