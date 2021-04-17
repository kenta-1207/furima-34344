# テーブル設計

## users テーブル

| Column          | Type   |  Options     |
|-----------------|--------|--------------|
| nickname        | string | null: false  |
| email           | string | unique: true |
| password        | string | null: false  |
| last_name       | string | null: false  |
| first_name      | string | null: false  |
| last_name_ruby  | string | null: false  |
| first_name_ruby | string | null: false  |
| birthday        | date   | null: false  |

### Association

- has_many :items
- has_many :purchases
- has_many :comments

## items テーブル

| Column             | Type           |  Options    |
|--------------------|----------------|-------------|
| item_name          | string         | null: false |
| item_description   | text           | null: false |
| category_id        | integer        | null: false |
| item_status_id     | integer        | null: false |
| delivery_charge_id | integer        | null: false |
| shipping_area_id   | integer        | null: false |
| shipping_days_id   | integer        | null: false |
| price              | string         | null: false |
| user               | references     |             |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

## purchases テーブル

| Column          | Type       | Option      |
|-----------------|------------|-------------|
| item            | references |             |

### Association

- has_one :shipping_addresses
- belongs_to :user
- belongs_to :item

## shipping_addresses テーブル

| Column         | Type   | Options     |
|----------------|--------|-------------|
| postal_code    | string | null: false |
| prefectures    | string | null: false |
| municipalities | string | null: false |
| address        | string | null: false |
| building_name  | string |             |
| phone_number   | string | null: false |

### Association

- belongs_to :purchases

## comments テーブル

| Column | Type       | Options     |
|--------|------------|-------------|
| text   | text       | null: false |
| user   | references |             |
| item   | references |             |

### Association

- belongs_to :items
- belongs_to :user
