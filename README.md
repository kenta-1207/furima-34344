# テーブル設計

## users テーブル

| Column                    | Type   |  Options                  |
|---------------------------|--------|---------------------------|
| nickname                  | string | null: false               |
| email                     | string | null: false, unique: true |
| encrypted_password        | string | null: false               |
| last_name                 | string | null: false               |
| first_name                | string | null: false               |
| last_name_ruby            | string | null: false               |
| first_name_ruby           | string | null: false               |
| birthday                  | date   | null: false               |

### Association

- has_many :items
- has_many :purchases
- has_many :comments

## items テーブル

| Column             | Type           |  Options          |
|--------------------|----------------|-------------------|
| name               | string         | null: false       |
| description        | text           | null: false       |
| category_id        | integer        | null: false       |
| item_status_id     | integer        | null: false       |
| delivery_charge_id | integer        | null: false       |
| prefecture_id      | integer        | null: false       |
| shipping_day_id   | integer        | null: false       |
| price              | integer        | null: false       |
| user               | references     | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

## purchases テーブル

| Column          | Type      | Option           |
|-----------------|-----------|------------------|
| item            | reference | foreign_key: true |
| user            | reference | foreign_key: true |

### Association

- has_one :shipping_address
- belongs_to :user
- belongs_to :item

## shipping_address テーブル

| Column         | Type    | Options           |
|----------------|---------|-------------------|
| postal_code    | string  | null: false       |
| prefecture_id  | integer | null: false       |
| municipalities | string  | null: false       |
| address        | string  | null: false       |
| building_name  | string  |                   |
| phone_number   | string  | null: false       |
| purchase       | string  | foreign_key: true |

### Association

- belongs_to :purchase

## comments テーブル

| Column | Type       | Options     |
|--------|------------|-------------|
| text   | text       | null: false |
| user   | references |             |
| item   | references |             |

### Association

- belongs_to :items
- belongs_to :user
