## DB　設計

## users table

|Column   |Type  |Options                  |
|---------|------|-------------------------|
|nick name|string|null:false               |
|email    |string|null:false, unique: true |
|password |string|null:false               |
|profile  |text  |null:false               |

### Association

* has_many :items
* has_many :purchases

## items table

|Column   |Type  |Options                  |
|---------|------|-------------------------|
|item name|string|null:false               |
|category |string|null:false, unique: true |
|price    |string|null:false               |
|image    |string|null:false               |
|seller   |text  |null:false               |
|comment  |text  |null:false               |

### Association

* belongs_to :user
* belongs_to :purchase

## purchases table

|Column   |Type  |Options                  |
|---------|------|-------------------------|
|buyer    |string|null:false               |
|address  |string|null:false, unique: true |

### Association

* belongs_to :user
* belongs_to :item