# see if we can modify the temporary item's thrower uuid with the players
execute store success score @s threw_item run data modify entity @e[type=item,tag=give_back,limit=1] Item.tag.tmp set from entity @s UUID
# modify back
data modify entity @e[type=item,tag=give_back,limit=1] Item.tag.tmp set from entity @e[type=item,tag=give_back,limit=1] Thrower
# identify person lol
# execute as @a[scores={threw_item=0}] run say hi
# if it modify worked, return fail bc it mean the uuid's were different
# execute if score @s threw_item matches 1 run return fail