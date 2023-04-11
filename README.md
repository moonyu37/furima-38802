# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
| Column             | Type   | Options                   |
| -------------------| -------| --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| kana_last_name     | string | null: false               |
| kana_first_name    | string | null: false               |
| birth_year         | integer| null: false               |
| birth_month        | integer| null: false               |
| birth_day          | integer| null: false               |

### Association
- has_many :items
- has_many :purchases
- has_one :address

## itemsテーブル
| Column           | Type      | Options                       |
| -----------------| ----------| ------------------------------|
| user             | references| null: false, foreign_key_true |
| image            | string    | null: false                   |
| item_name        | string    | null: false                   |
| explanation      | text      | null: false                   |
| category         | string    | null: false                   |
| condition        | string    | null: false                   |
| shipping_burden  | string    | null: false                   |
| sender_area      | string    | null: false                   |
| shipping_days    | string    | null: false                   |
| price            | integer   | null: false                   |

### Association
- belongs_to :user
- has_one :purchase

## addressテーブル
| Column             | Type    | Options        |
| -------------------| --------| ---------------|
| post_code          | string  | null: false    |
| prefectures        | string  | null: false    |
| municipalities     | string  | null: false    |
| street_address     | string  | null: false    |
| building_name      | string  |                |
| phone_number       | string  | null: false    |

### Association
- belongs_to :user
- belongs_to :purchase

## purchaseテーブル
| user       | references | null: false, foreign_key_true |
| item_name  | references | null: false, foreign_key_true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address
