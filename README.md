# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## usersテーブル
|Column|Type|Options|
|-------------------|--------|-------------------------|
|nickname           |string  |null: false              |
|email              |string  |null: false, unique: true|
|password           |string  |null: false              |
|encrypted_password |string  |null: false              |
|familyname         |string  |null: false              |
|firstname          |string  |null: false              |
|familyname_katakana|string  |null: false              |
|firstname_katakana |string  |null: false              |
|birthyear          |integer |null: false              |
|birthmonth         |integer |null: false              |
|birthday           |integer |null: false              |

## itemsテーブル
|Column|Type|Options|
|-----------------------|-------|-------|
|item_name              |string |null: false|
|description            |text   |null: false|
|category               |string |           |
|status                 |string |null: false|
|delivery_charge        |integer|null: false|
|delivery_source_center |string |null: false|
|days_up_to_delivery    |integer|null: false|
|price                  |integer|null: false|

## ordersテーブル
|Column|Type      |Options                       |
|------|----------|------------------------------|
|name  |references|null: false, foreign_key: true|
|user  |references|null: false, foreign_key: true|


## address
|Column       |Type    |Options    |
|-------------|--------|-----------|
|postal-code  |string  |null: false|
|prefecture   |string  |null: false|
|city         |string  |null: false|
|block        |string  |null: false|
|building     |string  |           |
|phone-number |string  |null: false|


* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
