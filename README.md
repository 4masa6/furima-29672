# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nicname         | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_read  | string | null: false |
| first_name_read | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| name           | string      | null: false                    |
| category       | integer_id  | null: false                    |
| price          | integer     | null: false                    |
| content        | text        | null: false                    |
| status         | integer_id  | null: false                    |
| burden         | integer_id  | null: false                    |
| Shipmentsource | integer_id  | null: false                    |
| deliverydate   | integer_id  | null: false                    |
| user           | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer

## buyers テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_num         | integer    | null: false                    |
| Prefectures      | integer_id | null: false                    |
| city             | text       | null: false                    |
| line             | text       | null: false                    |
| building         | text       |                                |
| tel_num          | integer    | null: false                    |
| card_num         | integer    | null: false                    |
| dead_line_month  | integer    | null: false                    |
| dead_line_year   | integer    | null: false                    |
| oder             | references | null: false, foreign_key: true |


### Association

- belongs_to :order

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
