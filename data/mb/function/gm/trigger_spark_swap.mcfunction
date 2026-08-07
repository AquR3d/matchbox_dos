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
# tellraw @a {"storage":"util:registers","nbt":"args.value"}
# get array element
# setup args...
data merge storage util:registers {args:{storage:"mb:registers",nbt:"current_players_queue"}}
# get array elem3ent
function util:get_array_element
# tellraw @a {"storage":"util:registers","nbt":"return.value"}

# setup aargs
data merge storage util:registers {args:{player_1:[],player_2:[]}}
# remove spark from queue and set player 1 to it...
data modify storage util:registers args.player_1 set from storage mb:data game.current_players[{role:"SPARK"}].UUID
# set util registers player 2 to UUID in return value...
data modify storage util:registers args.player_2 set from storage util:registers return.value.UUID
# swap...
# tellraw @a {"storage":"util:registers","nbt":"args"}
function util:swap_player_locations

# start cooldown...
data modify storage mb:data game.current_players[{role:"SPARK"}].can_swap set value false

# make timer...
function time:create_timer {id:"mb.swap",time:40,event_cmd:"function mb:gm/reset_spark_swap_cooldown"}

# show to spark?

# start the timer
function time:start_timer {id:"mb.swap"}