# auktion 
POST /api/login 
user login 
JSON body: takes the following properties
email: string 
password: string

Returns loggedin or not


POST api/register
register new user
JSON body: takes the following properties

firstname: string
lastname: string
email: string 
password: string


Returns regester or not



DELETE /api/login

user logout 
Returns logged out True



GET /api/user
get current user
returns info about current logged in user 



POST /api/updatebid
update bid 

JSON body: takes the following properties

user_id: int
price: int
item_id: int 

returns updated or not





POST /api/additem
add item to the item table
JSON body: takes the following properties

title: string
description: string
start_time: string 
end_time: string

returns if item is added or not




GET /api/getlistitem
get itemList
returns array of itmes



GET /api/getitem
get specific item
JSON body: takes the following properties
id: int 
returns item object



GET /api/getitemwithpicture
get items with picture url
returns list of items with picture url 



GET /api/getcurrentbid
get current bids 
returns a list of current ongoing bids 



GET /api/getfivelatestbids
get five latest bids 

returns an array of five latest bids










