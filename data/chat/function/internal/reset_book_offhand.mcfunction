#say hi
# replace signed book with writable book at current slot
item replace entity @s weapon.offhand with writable_book[minecraft:writable_book_content={}]
item modify entity @s weapon.offhand chat:set_chat_custom_data
item modify entity @s weapon.offhand chat:set_chat_name