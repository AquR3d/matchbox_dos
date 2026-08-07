# this function will end the game with current $end_state...

# first check if it exists...
$execute unless data storage mb:data const.end_state_functions[{state:"$(end_state)"}].event_cmd run return run \
tellraw @s {"text":"mb:gs/transitions/end_game: Tried to end game but couldn't find END_STATE_FUNCTION for $(end_state).","color":"red"}

# get event cmd of end_state...
data merge storage util:registers {args:{cmd:""}}
$data modify storage util:registers args.cmd set from storage mb:data const.end_state_functions[{state:"$(end_state)"}].event_cmd

# run command...
function util:run_command

# deceased players aren't on mb.sigmas

# clear items
execute as @a[team=mb.sigmas] run clear @s

# remove nametags and chat names...
execute as @a[team=mb.sigmas] run function nicks:remove_nametag
execute as @a[team=mb.sigmas] run function chat:remove_chat_nick

# make spectators in adventure mode
execute in overworld as @a if function mb:gm/check_is_spectator run gamemode adventure @s

# teleport & players spectators
execute in overworld as @a[team=mb.sigmas] run function util:map/set_spawn_in_candidate

# teleport.
function util:internal/tp_to_spawns {storage:"mb:data",nbt:"map.lobby_locs"}

# leave ig
team leave @a[team=mb.sigmas]

# remove storage from deceased players and current players and spectators
data modify storage mb:data game.current_players set value []
data modify storage mb:data game.deceased_players set value []
data modify storage mb:data game.spectators set value []

# tp to lobby



# also just go to pre game ig
data modify storage mb:data game.current_game_state set value "PRE_GAME"