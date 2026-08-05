# set people as candidates for tping
# needs the "spawn_in" tag...
#tag @a[team=sigmas,scores={nicks=0..}] add spawn_in/tag @a add spawn_in

# first check if array is empty...
$execute unless data storage $(storage) $(nbt)[] run return run \
tellraw @s {"text":"util:internal/tp_to_spawns: There are no locations to teleport to in the array.","color":"red"}

# spawn in armorstands on positions
$execute in overworld run function util:internal/spawn_locs {storage:"$(storage)",nbt:"$(nbt)"}
# start recursive tping
execute in overworld run function util:internal/tp_to_spawn_recurs
# say tping ended


# if there are still people needed to tp... we just run it again LOL
$execute if entity @a[tag=spawn_in] run return run function util:internal/tp_to_spawns {storage:"$(storage)",nbt:"$(nbt)"}

# remove tags
execute in overworld run function util:internal/reset_tp_tags