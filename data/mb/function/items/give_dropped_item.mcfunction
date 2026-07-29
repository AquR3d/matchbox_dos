# as the thrower, run give back item
$execute as @a[nbt={UUID:$(Thrower)}] run function mb:items/give_back $(Item)
# kill the item
kill @s
