# this function just saves the player's UUID as an object into the spectators array.
execute if function mb:gm/check_is_spectator run return run \
tellraw @s {"text":"mb:gm/add_spectator: The game detected this UUID is already a spectator.  \
If this is wrong, try running /function mb:gm/remove_spectator, followed up by this function again.","color":"red"}
# also automatically tps the spectator if the game is active

# setup args ig?
data merge storage mb:registers {obj:{UUID:[]}}
data modify storage mb:registers obj.UUID set from entity @s UUID

# add spectator
data modify storage mb:data game.spectators append from storage mb:registers obj

# check if need to tp...
# if pregame, dont do anything
execute if data storage mb:data {game:{current_game_state:"PRE_GAME"}} run return fail

# set to spectator
gamemode spectator @s

# otherwise, prolly tp...
function util:map/set_spawn_in_candidate

# if in map, tp to map
execute if data storage mb:data {game:{current_game_state:"IN_MAP"}} run return run \
function util:map/tp_to_spawns {storage:"mb:data",nbt:"map.spectator_spawn_locs"}

# if in transition, tp to map
execute if data storage mb:data {game:{current_game_state:"TRANSITION"}} run return run \
function util:map/tp_to_spawns {storage:"mb:data",nbt:"map.spectator_spawn_locs"}

# if in discussion or voting, tp to discussion
execute if data storage mb:data {game:{current_game_state:"IN_DISCUSSION"}} run return run \
function util:map/tp_to_spawns {storage:"mb:data",nbt:"map.spectator_spawn_locs"}

execute if data storage mb:data {game:{current_game_state:"IN_VOTING"}} run return run \
function util:map/tp_to_spawns {storage:"mb:data",nbt:"map.spectator_spawn_locs"}

# then we consider if paused... do all these but with paused_game_state
# if in map, tp to map
execute if data storage mb:data {game:{paused_game_state:"IN_MAP"}} run return run \
function util:map/tp_to_spawns {storage:"mb:data",nbt:"map.spectator_spawn_locs"}

# if in transition, tp to map
execute if data storage mb:data {game:{paused_game_state:"TRANSITION"}} run return run \
function util:map/tp_to_spawns {storage:"mb:data",nbt:"map.spectator_spawn_locs"}

# if in discussion or voting, tp to discussion
execute if data storage mb:data {game:{paused_game_state:"IN_DISCUSSION"}} run return run \
function util:map/tp_to_spawns {storage:"mb:data",nbt:"map.spectator_spawn_locs"}

execute if data storage mb:data {game:{paused_game_state:"IN_VOTING"}} run return run \
function util:map/tp_to_spawns {storage:"mb:data",nbt:"map.spectator_spawn_locs"}