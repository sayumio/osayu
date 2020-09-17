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

## goods テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ------------|
| name    | string     | null: false |
| comment | text       | null: false |
| category| boolean    | null: false |
| status  | boolean    | null: false |
| charges | boolean    | null: false |
| area    | integer    | null: false |
| days    | integer    | null: false |
| price   | string     | null: false |
| content | text       |             |

## Purchase テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| postalcode   | string | null: false |
| prefectures  | string | null: false |
| municipality | string | null: false |
| addressnum   | string | null: false |
| building     | string |             |
| phonenum     | string | null: false |



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
