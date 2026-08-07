# this function will end the game with current $end_state...

# first check if it exists...
$execute unless data storage mb:data const.end_state_functions[{state:"$(end_state)"}].event_cmd run return run \
tellraw @s {"text":"mb:gs/transitions/end_game: Tried to end game but couldn't find END_STATE_FUNCTION for $(end_state).","color":"red"}

# get event cmd of end_state...
data merge storage util:registers {args:{cmd:""}}
$data modify storage util:registers args.cmd set from storage mb:data const.end_state_functions[{state:"$(end_state)"}].event_cmd

# run command...
function util:run_command

# clear items
execute as @a if function mb:gm/check_player_in_game run clear @s

# remove nametags and chat names...
execute as @a if function mb:gm/check_player_in_game run function nicks:remove_nametag
execute as @a if function mb:gm/check_player_in_game run function chat:remove_chat_nick

# leave ig
team leave @a[team=mb.sigmas]

# remove storage from deceased players and current players and spectators
data modify storage mb:data game.current_players set value []
data modify storage mb:data game.deceased_players set value []
data modify storage mb:data game.spectators set value []



# also just go to pre game ig
data modify storage mb:data game.current_game_state set value "PRE_GAME"