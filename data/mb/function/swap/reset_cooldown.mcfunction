# reset timer
scoreboard players set $timer swap 0
# give trigger back
# item replace entity @a[tag=spark] container.14 with diamond
# make spark be able to do it again
scoreboard players set $spark swap 1
# say swap is ready
execute as @a[team=sigmas,tag=spark] run title @s actionbar [{"text":"[SWAP]","color":"yellow"},{"text":" action is ready.","color":"white"}]