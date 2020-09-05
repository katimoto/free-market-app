# テーブル設計

## users テーブル

| Column     | Type     | Options     |
| --------   | ------   | ----------- |
| nickname   | string   | null: false |
| email      | string   | null: false |
| password   | string   | null: false |
| birthday   | datetime | null: false |
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
| exhibitor  | string   | null: false                    |
| price      | integer  | null: false                    |
| address    | integer  | null: false                    |
| shipment   | datetime | null: false                    |
| image      | text     | null: false                    |
| text       | text     | null: false                    |
| fee        | integer  | null: false                    |
| userid     | integer  | null: false, foreign_key: true |
| addressid  | integer  | null: false, foreign_key: true |

### Association

- belongs to :user
- belongs to :address

## purchases テーブル

| Column     | Type     | Options                        |
| --------   | ------   | ------------------------------ |
| cardnumber | integer  | null: false                    |
| x_day      | datetime | null: false                    |
| cvc        | integer  | null: false                    |
| userid     | integer  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address

## addresses テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| zip        | integer    |                                |
| prefecture | string     | null: false                    |
| city       | string     | null: false                    |
| address    | string     | null: false                    |
| buildname  | string     |                                |
| phonecall  | integer    | null: false                    |
| userid     | integer    | null: false, foreign_key: true |
| addressid  | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchases