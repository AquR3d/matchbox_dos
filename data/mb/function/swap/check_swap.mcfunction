# may change this later
# first part checks if spark can use swap, next part if spark triggered its use
# execute if score $spark swap matches 1 as @a[tag=spark,nbt={Inventory:[{Slot:13b,id:"minecraft:diamond"}]}] at @s run function mb:swap/swap_locations

# i can make a different trigger now with hotbar key
# get current hotkey spark is on
execute store result score $curr_key swap run data get entity @a[limit=1,tag=spark] SelectedItemSlot 1.0
# compare
execute if score $spark swap matches 1 if score $curr_key swap = $swap_key swap as @a[tag=spark] at @s run function mb:swap/swap_locations