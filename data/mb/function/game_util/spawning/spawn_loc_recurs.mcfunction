# if no more spawn locs, stop spawning
execute if data storage matchbox:data {spawn_locs_tmp:[]} run return fail
# summon an armorstand
# summon armor_stand ~ ~ ~ {Invisible:1b,Invulnerable:1b,Tags:[tp_loc,to_modify]}
summon armor_stand ~ ~ ~ {Invulnerable:1b,Tags:[tp_loc,to_modify]}
# modify its data to be a position
execute as @e[type=armor_stand,tag=tp_loc,tag=to_modify] run data modify entity @s Pos set from storage matchbox:data spawn_locs_tmp[0]
# reset tag
tag @e[type=armor_stand,tag=tp_loc,tag=to_modify] remove to_modify
# traverse array
data remove storage matchbox:data spawn_locs_tmp[0]
# go next
function mb:game/spawning/spawn_loc_recurs
