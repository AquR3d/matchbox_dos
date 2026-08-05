
say id to iv

# give papers...
execute in overworld as @a if function mb:gm/check_player_in_game run function mb:gu/voting/give_papers

# set game state to transition..
# set new game state...
data modify storage mb:data game.current_game_state set value "IN_VOTING"

# create another timer...

function time:create_timer {id:"mb.in_voting",time:230,event_cmd:"function mb:gs/transitions/iv_to_transition"}

execute as @a if function mb:gm/check_player_in_game run function time:show_timer_to_player {id:"mb.in_voting"}
function time:start_timer {id:"mb.in_voting"}
