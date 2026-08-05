# if no more spawn locs, stop spawning
execute unless data storage util:registers args.spawn_locs_queue[] run return fail

# summon an armorstand
# summon armor_stand ~ ~ ~ {Invisible:1b,Invulnerable:1b,Tags:[tp_loc,to_modify]}
summon marker ~ ~ ~ {Tags:[tp_loc,to_modify]}
# modify its data to be a position
execute as @e[type=marker,tag=tp_loc,tag=to_modify] run data modify entity @s Pos set from storage util:registers args.spawn_locs_queue[0]
# reset tag
tag @e[type=marker,tag=tp_loc,tag=to_modify] remove to_modify
# traverse array
data remove storage util:registers args.spawn_locs_queue[0]
# go next
function util:internal/spawn_loc_recurs
