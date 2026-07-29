# get the current hotbar key the spark has and store that as the swap key
# run this command as execute as spark_player run THIS FUNCTION
execute store result score $swap_key swap run data get entity @s[tag=spark] SelectedItemSlot 1
# for testing
# tellraw @a [{"text":"spark swapkey assigned to hotbar index "},{"score":{"name":"$swap_key","objective":"swap"}}]