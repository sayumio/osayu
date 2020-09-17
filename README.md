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
| password | string | null: false unique: true|
| name     | string | null: false |
| kananame | string | null: false |
| birthday |  date  | null: false |

## goods_users テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| photo       | text       | null: false |
| goodsname   | string     | null: false |
| goodscomment| string     | null: false |
| goodsStatus | boolean    | null: false |
| area        | string     | null: false |
| days        | string     | null: false |
| price       | string     | null: false |

## goods テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| goodsname   | references | null: false |
| goodscomment| references | null: false |
| goodsStatus | references | null: false |
| area        | references | null: false |
| days        | references | null: false |
| price       | references | null: false |
| content     | string     |             |

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
