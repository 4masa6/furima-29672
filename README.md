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

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| name              | string      | null: false                    |
| category_id       | integer     | null: false                    |
| price             | integer     | null: false                    |
| content           | text        | null: false                    |
| status_id         | integer     | null: false                    |
| burden_id         | integer     | null: false                    |
| Shipmentsource_id | integer     | null: false                    |
| deliverydate_id   | integer     | null: false                    |
| user              | references  | null: false, foreign_key: true |

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

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| post_num         | string      | null: false                    |
| prefecture_id    | integer     | null: false                    |
| city             | integer     | null: false                    |
| line             | integer     | null: false                    |
| building         | integer     |                                |
| tel_num          | integer     | null: false                    |
| order            | references  | null: false, foreign_key: true |


### Association

- belongs_to :order

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
