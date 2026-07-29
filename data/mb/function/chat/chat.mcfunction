# write in chat message in quill and reset quill
execute if score @s nicks matches 0 run tellraw @a [{"text":"<"},{"nbt":"nicks_chat[0]","storage":"matchbox:data"},{"text":"> "},{"nbt":"Inventory[{tag:{Chat:1b}}].tag.pages[0]","entity":"@s"}]
execute if score @s nicks matches 1 run tellraw @a [{"text":"<"},{"nbt":"nicks_chat[1]","storage":"matchbox:data"},{"text":"> "},{"nbt":"Inventory[{tag:{Chat:1b}}].tag.pages[0]","entity":"@s"}]
execute if score @s nicks matches 2 run tellraw @a [{"text":"<"},{"nbt":"nicks_chat[2]","storage":"matchbox:data"},{"text":"> "},{"nbt":"Inventory[{tag:{Chat:1b}}].tag.pages[0]","entity":"@s"}]
execute if score @s nicks matches 3 run tellraw @a [{"text":"<"},{"nbt":"nicks_chat[3]","storage":"matchbox:data"},{"text":"> "},{"nbt":"Inventory[{tag:{Chat:1b}}].tag.pages[0]","entity":"@s"}]
execute if score @s nicks matches 4 run tellraw @a [{"text":"<"},{"nbt":"nicks_chat[4]","storage":"matchbox:data"},{"text":"> "},{"nbt":"Inventory[{tag:{Chat:1b}}].tag.pages[0]","entity":"@s"}]
execute if score @s nicks matches 5 run tellraw @a [{"text":"<"},{"nbt":"nicks_chat[5]","storage":"matchbox:data"},{"text":"> "},{"nbt":"Inventory[{tag:{Chat:1b}}].tag.pages[0]","entity":"@s"}]
execute if score @s nicks matches 6 run tellraw @a [{"text":"<"},{"nbt":"nicks_chat[6]","storage":"matchbox:data"},{"text":"> "},{"nbt":"Inventory[{tag:{Chat:1b}}].tag.pages[0]","entity":"@s"}]
execute if score @s nicks matches 7 run tellraw @a [{"text":"<"},{"nbt":"nicks_chat[7]","storage":"matchbox:data"},{"text":"> "},{"nbt":"Inventory[{tag:{Chat:1b}}].tag.pages[0]","entity":"@s"}]
execute if score @s nicks matches 8 run tellraw @a [{"text":"<"},{"nbt":"nicks_chat[8]","storage":"matchbox:data"},{"text":"> "},{"nbt":"Inventory[{tag:{Chat:1b}}].tag.pages[0]","entity":"@s"}]
execute if score @s nicks matches 9 run tellraw @a [{"text":"<"},{"nbt":"nicks_chat[9]","storage":"matchbox:data"},{"text":"> "},{"nbt":"Inventory[{tag:{Chat:1b}}].tag.pages[0]","entity":"@s"}]
clear @s writable_book 1
clear @s written_book 1
item replace entity @s weapon.offhand with minecraft:writable_book{give_back:1b,Chat:1b,display:{Name:'{"text":"Chat"}'}} 1