# PROLLY DO NOT RUN THIS WITHOUT CONTEXT.

# starts the in map... resets signs... tp player... give items, create timer...

function time:create_timer {id:"mb.in_map",time:200,event_cmd:"function mb:gs/transitions/im_to_transition"}

# shwo timer to all...
execute as @a if function mb:gm/check_player_in_game run function time:show_timer_to_player {id:"mb.in_map"}

# start timer...
function time:start_timer {id:"mb.in_map"}

# change game state...
data modify storage mb:data game.current_game_state set value "IN_MAP"