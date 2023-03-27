## DB　設計

## users table


|Column               |Type  |Options                  |
|---------------------|------|-------------------------|
|nick_name            |string|null:false               |
|email                |string|null:false, unique: true |
|encrypted_password   |string|null:false               |
|family_name          |string|null:false               |
|first_name           |string|null:false               |
|family_name_kana     |string|null:false               |
|first_name_kana      |string|null:false               | 
|birth                |date  |null:false               |


### Association

* has_many :items
* has_many :purchases

## items table


|Column   |Type  |Options   |
|---------|------|----------|
|item_name|string|null:false|
|category |string|null:false|
|situation|string|null:false|
|delivery |string|null:false|
|region   |string|null:false|
|deadline |string|null:false|
|price    |string|null:false|
|item_text|text  |null:false|



### Association

* belongs_to :user
* belongs_to :purchase

## purchases table


|Column        |Type  |Options                             |
|--------------|------|------------------------------------|
|user_id       |string|references :user,  foreign_key: true|
|item_id       |string|references :item,  foreign_key: true|


### Association

* belongs_to :user
* belongs_to :item
* has_one :address

## addresses table

|Column        |Type  |Options   |
|--------------|------|----------|
|post_code     |string|null:false|
|prefectures   |string|null:false,references :item, foreign_key: true|
|municipalities|string|null:false|
|banchi        |string|null:false|
|building_name |string|null:false|
|number        |string|null:false|


