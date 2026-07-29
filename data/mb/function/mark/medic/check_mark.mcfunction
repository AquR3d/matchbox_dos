# tp interaction
function mb:mark/medic/tp_interaction
# if interaction not on cooldown, check for interaction and find who marker is looking at
execute if score $medic used_mark matches 0 run execute as @e[type=minecraft:interaction,tag=m.int] on target if entity @s[tag=medic] run function mb:mark/medic/attempt_mark
# reset interaction
execute as @e[type=minecraft:interaction,tag=m.int] run data remove entity @s interaction