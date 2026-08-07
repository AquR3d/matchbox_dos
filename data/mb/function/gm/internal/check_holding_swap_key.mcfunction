# checks if $UUID which should be spark is holding swap key...

# $spark_selected_item_slot will hold the spark's current hotbar slot
$execute store result score $spark_selected_item_slot mb.data in overworld as @a[nbt={UUID:$(UUID)}] run data get entity @s SelectedItemSlot

# add 1 to spark selected item slot...
scoreboard players add $spark_selected_item_slot mb.data 1

# compare with mb.swap preferences of this player..
$return run execute if score @a[nbt={UUID:$(UUID)},limit=1] mb.swap = $spark_selected_item_slot mb.data