# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false unique: true|
| password | string | null: false |
| sei      | string | null: false |
| mei      | string | null: false |
| kanasei  | string | null: false |
| kanamei  | string | null: false |
| birthday |  date  | null: false |

### Association

- has_many :items
- has_many :managements

## items テーブル

| Column     | Type       | Options     |
| -------    | ---------- | ------------|
| name       | string     | null: false |
| comment    | text       | null: false |
| category_id| integer    | null: false |
| status_id  | integer    | null: false |
| charges_id | integer    | null: false |
| area_id    | integer    | null: false |
| days_id    | integer    | null: false |
| price      | integer    | null: false |
| user_id    | integer    | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column          | Type       | Options                        |
| -------         | ---------- | ------------------------------ |
| postalcode      | string  | null: false foreign_key: true|
| prefectures_id  | integer | null: false foreign_key: true|
| municipality    | string  | null: false foreign_key: true|
| addressnum      | string  | null: false foreign_key: true|
| building        | string  | foreign_key: true|
| phonenum        | string  | null: false foreign_key: true|

### Association

- belongs_to :management


## managements テーブル

| Column   | Type       | Options     |
| -------  | ---------- | ----------- |
| user_id | integer    | null: false unique: true foreign_key: true|
| item_id  | integer    | null: false unique: true foreign_key: true|

### Association

- belongs_to :user
- has_one :purchase
- belongs_to :item


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
