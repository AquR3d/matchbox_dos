# this function is run to freeze players and that blindness transition....

# say in map transitioning to in discussion...

# turn off friendly fire...
team modify mb.sigmas friendlyFire false

# make them immobile...
execute in overworld as @a run function mb:gu/misc/immobile

# set game state to transition..
# set new game state...
data modify storage mb:data game.current_game_state set value "TRANSITION"

# remove spark timer
function time:remove_timer {id:"mb.swap"}



# setup args...
data merge storage mb:registers {args:{id:"mb.transition_to_id",time:67,event_cmd:"function mb:gs/transitions/transition_to_id"}}
# we scale by 20 for tick time, scoreboard should have seconds...
execute store result storage mb:registers args.time int 20.0 run scoreboard players get $transition mb.time
# creat timer to transition to in discussion...
function time:create_timer with storage mb:registers args

# start timer
function time:start_timer {id:"mb.transition_to_id"}