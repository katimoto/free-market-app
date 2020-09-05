# テーブル設計

## users テーブル

| Column     | Type     | Options     |
| --------   | ------   | ----------- |
| nickname   | string   | null: false |
| email      | string   | null: false |
| password   | string   | null: false |
| birthday   | date     | null: false |
| firstname  | string   | null: false |
| lastname   | string   | null: false |
| f_kana     | string   | null: false |
| l_kana     | string   | null: false |



### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column     | Type     | Options                        |
| --------   | ------   | ------------------------------ |
| name       | string   | null: false                    |
| category   | integer  | null: false                    |
| price      | integer  | null: false                    |
| satatus    | integer  | null: false                    |
| address    | integer  | null: false                    |
| shipment   | integer  | null: false                    |
| text       | text     | null: false                    |
| fee        | integer  | null: false                    |
| user_id    | integer  | null: false, foreign_key: true |

### Association

- belongs to :user
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

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| zip         | string     |                                |
| prefecture  | integer    | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| buildname   | string     |                                |
| phonecall   | string     | null: false                    |
| item_id     | integer    | null: false, foreign_key: true |
| purchase_id | integer    | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :purchase