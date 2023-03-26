## DB　設計

## users table

|Column               |Type  |Options                  |
|---------------------|------|-------------------------|
|nick_name            |string|null:false, unique: true |
|email                |string|null:false, unique: true |
|encrypted_password   |string|null:false, unique: true |
|confirmation_password|string|null:false, unique: true |
|family_name          |string|null:false, unique: true |
|first_name           |string|null:false, unique: true |
|year                 |string|null:false, unique: true |
|month                |string|null:false, unique: true |
|day                  |string|null:false, unique: true |

### Association

* has_many :items
* has_many :purchases
* belongs_to :address

## items table

|Column   |Type  |Options                  |
|---------|------|-------------------------|
|item_name|string|null:false, unique: true|
|category |string|null:false, unique: true|
|situation|string|null:false, unique: true|
|delivery |string|null:false, unique: true|
|region   |string|null:false, unique: true|
|deadline |string|null:false, unique: true|
|price    |string|null:false, unique: true|
|item_text|text  |null:false, unique: true|

### Association

* belongs_to :user
* belongs_to :purchase

## purchases table

|Column        |Type  |Options                  |
|--------------|------|-------------------------|
|credit        |string|null:false, unique: true|
|date          |string|null:false, unique: true|
|code          |string|null:false, unique: true|
|post_code     |string|null:false, unique: true|


### Association

* belongs_to :user
* belongs_to :item

## addresses table

|Column        |Type  |Options                  |
|--------------|------|-------------------------|
|prefectures   |string|null:false, unique: true |
|municipalities|string|null:false, unique: true |
|banchi        |string|null:false, unique: true |
|building_name |string|null:false               |
|number        |string|null:false, unique: true |


### Association

* belongs_to :user