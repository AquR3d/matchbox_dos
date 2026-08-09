
# say id to iv

# give papers...
execute in overworld as @a if function mb:gm/check_player_in_game run function mb:gu/voting/give_papers

# set game state to transition..
# set new game state...
data modify storage mb:data game.current_game_state set value "IN_VOTING"

# create another timer...
# setup args...
data merge storage mb:registers {args:{id:"mb.in_voting",time:67,event_cmd:"function mb:gs/transitions/iv_to_transition"}}
# we scale by 20 for tick time, scoreboard should have seconds...
execute store result storage mb:registers args.time int 20.0 run scoreboard players get $in_voting mb.time

function time:create_timer with storage mb:registers args

execute as @a if function mb:gm/check_player_in_game run function time:show_timer_to_player {id:"mb.in_voting"}
function time:start_timer {id:"mb.in_voting"}
