# now we gon assign roles...

# by default everyone is innocent with the add player function..
# reset roles...
function mb:gm/reset_roles

# so we're only gonna assign the spark and medic!

# check if there are enough, for now minimum is 2 players ig...
execute unless data storage mb:data game.current_players[1] run return run \
tellraw @s {"text":"mb:gm/assign_roles: Not enough players to assign roles.","color":"red"}

# generate player queue...
data modify storage mb:registers current_players_queue set from storage mb:data game.current_players

# setup args...
execute store result storage util:registers args.value int 1.0 run function util:internal/get_array_size {storage:"mb:registers","nbt":"current_players_queue"}

# generate random array index with queue array size...
execute store result storage util:registers args.value int 1.0 run function util:get_random_array_index

# set up other args...
data merge storage util:registers {args:{storage:"mb:registers",nbt:"current_players_queue"}}
# get array element/player in player queue in mb:registers args.value to get player
function util:get_array_element
data modify storage mb:registers args.value set from storage util:registers return.value

# run set spark with this player...
function mb:gm/internal/assign_spark with storage mb:registers args.value

# now do the same process but for medic...

# setup args...
execute store result storage util:registers args.value int 1.0 run function util:internal/get_array_size {storage:"mb:registers","nbt":"current_players_queue"}

# generate random array index with queue array size...
execute store result storage util:registers args.value int 1.0 run function util:get_random_array_index

# set up other args...
data merge storage util:registers {args:{storage:"mb:registers",nbt:"current_players_queue"}}
# get array element/player in player queue in mb:registers args.value to get player
function util:get_array_element
data modify storage mb:registers args.value set from storage util:registers return.value

# run set medic with this player...
function mb:gm/internal/assign_medic with storage mb:registers args.value

