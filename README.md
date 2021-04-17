# テーブル設計

## users テーブル

| Column    | Type    |  Options    |
|-----------|---------|-------------|
| nickname  | string  | null: false |
| email     | string  | null: false |
| password  | string  | null: false |
| name      | string  | null: false |
| name_ruby | string  | null: false |
| birthday  | string  | null: false |

### Association

- has_many :items
- has_many :purchases
- has_many :comments

## items テーブル

| Column           | Type           |  Options    |
|------------------|----------------|-------------|
| item_name        | string         | null: false |
| image            | Active_storage | null: false |
| item_description | text           | null: false |
| category         | string         | null: false |
| item_status      | string         | null: false |
| delivery_charge  | string         | null: false |
| shipping_area    | string         | null: false |
| shipping_days    | string         | null: false |
| price            | string         | null: false |
| user             | references     |             |

### Association

- belongs_to :user
- has_many :comments

## purchases テーブル

| Column          | Type       | Option      |
|-----------------|------------|-------------|
| card_number     | string     | null: false |
| expiration_date | string     | null: false |
| security_code   | string     | null: false |
| item            | references |             |

### Association

- has_one :shipping_addresses
- belongs_to :user

## shipping_addresses テーブル

| Column         | Type   | Options     |
|----------------|--------|-------------|
| postal_code    | string | null: false |
| prefectures    | string | null: false |
| municipalities | string | null: false |
| address        | string | null: false |
| building_name  | string | null: false |
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
