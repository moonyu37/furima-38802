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
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| kana_last_name     | string | null: false               |
| kana_first_name    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル
| Column             | Type      | Options                       |
| -------------------| ----------| ------------------------------|
| user               | references| null: false, foreign_key_true |
| item_name          | string    | null: false                   |
| explanation        | text      | null: false                   |
| category_id        | integer   | null: false                   |
| condition_id       | integer   | null: false                   |
| shipping_burden_id | integer   | null: false                   |
| sender_area_id     | integer   | null: false                   |
| shipping_day_id    | integer   | null: false                   |
| price              | integer   | null: false                   |

### Association
- belongs_to :user
- has_one :purchase

## addressesテーブル
| Column             | Type       | Options                       |
| -------------------| ---------- | ------------------------------|
| post_code          | string     | null: false                   |
| sender_area_id     | integer    | null: false                   |
| municipalities     | string     | null: false                   |
| street_address     | string     | null: false                   |
| building_name      | string     |                               |
| phone_number       | string     | null: false                   |
| purchase           | references | null: false, foreign_key_true |

### Association
- belongs_to :purchase

## purchasesテーブル
| user       | references | null: false, foreign_key_true |
| item       | references | null: false, foreign_key_true |

### Association
- belongs_to :item
- has_one :address
