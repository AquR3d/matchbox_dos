
say transition to id

# OKAY SO WE NEED TO DETERMINE IF WE NEED TO DECEASE A PLAYER.
execute if data storage mb:data game.current_players[{marked:{spark:true}}] run \
function mb:gm/internal/check_decease_marked_player

# check end game state
function mb:gm/check_end_game_decision

# if not continue, end the game...
execute unless data storage mb:data {game:{end_state:"CONTINUE"}} run return run \
function mb:gs/transitions/end_game with storage mb:data game

# clear items and give chat book
execute in overworld as @a if function mb:gm/check_player_in_game run clear @s
execute in overworld as @a if function mb:gm/check_player_in_game run function chat:give_chat_offhand

# hide nametags...
execute as @a if function mb:gm/check_player_in_game run function nicks:hide_nametag {hide:true}

# teleport players...
function mb:gm/map/tp_players_to_discussion_room

# teleport spectators...

# set new game state...
data modify storage mb:data game.current_game_state set value "IN_DISCUSSION"

# create new timer
function time:create_timer {id:"mb.in_discussion",time:300,event_cmd:"function mb:gs/transitions/id_to_iv"}

execute as @a if function mb:gm/check_player_in_game run function time:show_timer_to_player {id:"mb.in_discussion"}
function time:start_timer {id:"mb.in_discussion"}