#say hi
# replace signed book with writable book at current slot
$item replace entity @s weapon.offhand with minecraft:writable_book $(Count)
# replace with default chat stuff
item modify entity @s weapon.offhand chat:chat