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
- has_many :buyers

## items テーブル

| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| name           | string      | null: false                    |
| category       | integer     | null: false                    |
| price          | integer     | null: false                    |
| text           | text        | null: false                    |
| status         | integer     | null: false                    |
| burden         | integer     | null: false                    |
| Shipmentsource | integer     | null: false                    |
| deliverydate   | integer     | null: false                    |
| user           | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## buyers テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| address          | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs:：purchase

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
