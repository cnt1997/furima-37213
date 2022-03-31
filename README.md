# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## usersテーブル
|Column             |Type    |Options                  |
|-------------------|--------|-------------------------|
|email              |string  |null: false, unique: true|
|encrypted_password |string  |null: false              |
|nickname           |string  |null: false              |
|familyname         |string  |null: false              |
|firstname          |string  |null: false              |
|familyname_katakana|string  |null: false              |
|firstname_katakana |string  |null: false              |
|birthday           |date    |null: false              |

### Association
- has_many :items
- has_many :orders

## itemsテーブル
|Column|Type|Options|
|----------------------|-----------|-----------------------------|
|item_name             |string     |null: false                   |
|description           |text       |null: false                   |
|category_id           |integer    |null: false                   |
|status_id             |integer    |null: false                   |
|delivery_charge_id    |integer    |null: false                   |
|days_up_to_delivery_id|integer    |null: false                   |
|price                 |integer    |null: false                   |
|user                  |references |null: false, foreign_key: true|
|prefecture_id         |integer    |null: false                   |

### Association
- belongs_to :user
- has_one :address

## ordersテーブル
|Column|Type      |Options                       |
|------|----------|------------------------------|
|item  |references|null: false, foreign_key: true|
|user  |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル
|Column       |Type       |Options    |
|-------------|-----------|-----------|
|postal_code  |string     |null: false|
|prefecture_id|integer    |null: false|
|city         |string     |null: false|
|block        |string     |null: false|
|building     |string     |           |
|phone_number |string     |null: false|
|order        |references |null: false, foreign_key: true|

### Association
- belongs_to :order

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
