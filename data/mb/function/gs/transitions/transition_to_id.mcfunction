
say transition to id

# set new game state...
data modify storage mb:data game.current_game_state set value "IN_DISCUSSION"

# create new timer
function time:create_timer {id:"mb.in_discussion",time:300,event_cmd:"function mb:gs/transitions/id_to_iv"}

execute as @a if function mb:gm/check_player_in_game run function time:show_timer_to_player {id:"mb.in_discussion"}
function time:start_timer {id:"mb.in_discussion"}