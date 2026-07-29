# tp interaction, should resummon the spark interaction box for right click checking
function mb:mark/spark/tp_interaction
# if interaction not on cooldown, check for interaction and find who marker is looking at
execute if score $spark used_mark matches 0 run execute as @e[type=minecraft:interaction,tag=s.int] on target if entity @s[tag=spark] run function mb:mark/spark/attempt_mark
# reset interaction
execute as @e[type=minecraft:interaction,tag=s.int] if data entity @s interaction run data remove entity @s interaction
# execute as @e[type=minecraft:interaction,tag=s.int] run data remove entity @s interaction