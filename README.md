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
| category   | string   | null: false                    |
| price      | integer  | null: false                    |
| address    | integer  | null: false                    |
| shipment   | datetime | null: false                    |
| image      | text     | null: false                    |
| text       | text     | null: false                    |
| fee        | integer  | null: false                    |
| user_id    | integer  | null: false, foreign_key: true |
| address_id | integer  | null: false, foreign_key: true |

### Association

- belongs to :user
- belongs to :address
- belongs to :purchase

## purchases テーブル

| Column     | Type     | Options                        |
| --------   | ------   | ------------------------------ |
| user_id    | integer  | null: false, foreign_key: true |
| item_id    | integer  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address
- has_one :item

## addresses テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| zip        | string     |                                |
| prefecture | integer    | null: false                    |
| city       | string     | null: false                    |
| address    | string     | null: false                    |
| buildname  | string     |                                |
| phonecall  | string     | null: false                    |
| user_id    | integer    | null: false, foreign_key: true |
| address_id | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase