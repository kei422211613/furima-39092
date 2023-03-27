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
|category_id |integer|null:false|
|situation_id|integer|null:false|
|delivery_fee_payment_id |integer|null:false|
|region_id   |integer|null:false|
|deadline_id |integer|null:false|
|price    |integer|null:false|
|item_text|text  |null:false|
|user_id|references|references :user,  foreign_key: true|



### Association

* belongs_to :user
* has_one :purchase
* has_one :address

## purchases table


|Column        |Type  |Options                             |
|--------------|------|------------------------------------|
|user_id       |references|references :user,  foreign_key: true|
|item_id       |references|references :item,  foreign_key: true|


### Association

* belongs_to :user
* belongs_to :item
* has_one :address

## addresses table

|Column        |Type  |Options   |
|--------------|------|----------|
|post_code     |string|null:false|
|region_id   |integer|null:false|
|municipalities|string|null:false|
|banchi        |string|null:false|
|building_name |string||
|number        |string|null:false|
|purchase_id|references|references :purchase,  foreign_key: true|

### Association

* belongs_to :purchase
* belongs_to :item
