# this function triggers swapping the spark and a random player, and starts the CD...

# say attempting swap...

# create a queue
data modify storage mb:registers current_players_queue set from storage mb:data game.current_players

# remove spark form queue
data remove storage mb:registers current_players_queue[{role:"SPARK"}]

# get random int index in queue for random player...
# get array size into value...
execute store result storage util:registers args.value int 1.0 run function util:internal/get_array_size {storage:"mb:registers",nbt:"current_players_queue"}
# tellraw @a {"storage":"util:registers","nbt":"args.value"}
# get random index...
execute store result storage util:registers args.value int 1.0 run function util:get_random_array_index

# get array element
# setup args...
data merge storage util:registers {args:{storage:"mb:registers",nbt:"current_players_queue"}}
tellraw @a {"storage":"util:registers","nbt":"args"}
# get array elem3ent
function util:get_array_element
tellraw @a {"storage":"util:registers","nbt":"return.value"}

# setup aargs
data merge storage util:registers {args:{player_1:[],player_2:[]}}
# set util registers player 2 to UUID in return value...
data modify storage util:registers args.player_2 set from storage util:registers return.value.UUID
# remove spark from queue and set player 1 to it...
data modify storage util:registers args.player_1 set from storage mb:data game.current_players[{role:"SPARK"}].UUID

# swap...
# tellraw @a {"storage":"util:registers","nbt":"args"}
function util:swap_player_locations

# start cooldown...
data modify storage mb:data game.current_players[{role:"SPARK"}].can_swap set value false

# make timer...
# setup args...
data merge storage mb:registers {args:{id:"mb.swap",time:40,event_cmd:"function mb:gm/reset_spark_swap_cooldown"}}
# we scale by 20 for tick time, scoreboard should have seconds...
execute store result storage mb:registers args.time int 20.0 run scoreboard players get $swap mb.time
# create timer with args
function time:create_timer with storage mb:registers args

# lowk.. im gonna display it to the spark
execute in overworld as @a if function mb:gm/check_is_spark run \
function time:show_timer_to_player {id:"mb.swap"}

# show to spark?

# start the timer
function time:start_timer {id:"mb.swap"}