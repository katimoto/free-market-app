# テーブル設計

## users テーブル

| Column     | Type     | Options     |
| --------   | ------   | ----------- |
| nickname   | string   | null: false |
| email      | string   | null: false |
| password   | string   | null: false |
| first_name | string   | null: false |
| last_name  | string   | null: false |
| f_kana     | string   | null: false |
| l_kana     | string   | null: false |
| birthdate  | date     | null: false |



### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type     | Options                        |
| --------     | ------   | ------------------------------ |
| name         | string   | null: false                    |
| price        | integer  | null: false                    |
| category_id  | integer  | null: false                    |
| deliv_fee_id | integer  | null: false                    |
| status_id    | integer  | null: false                    |
| address_id   | integer  | null: false                    |
| shipment_id  | integer  | null: false                    |
| text         | text     | null: false                    |
| user_id      | integer  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column     | Type     | Options                        |
| --------   | ------   | ------------------------------ |
| user_id    | integer  | null: false, foreign_key: true |
| item_id    | integer  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address
- belongs_to :item

## addresses テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| zip           | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| buildname     | string     |                                |
| phonecall     | string     | null: false                    |
| purchase_id   | integer    | null: false, foreign_key: true |

### Association

- belongs_to :purchase