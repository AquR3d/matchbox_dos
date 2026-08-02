# this function will assign nicks to all the current players...
# assuming there are enough names in the name pool.
# and also only assigns names to people who haven't been named yet

# check if there are players first...
execute unless data storage mb:data game.current_players[] run return run \
tellraw @s {"text":"mb:gm/assign_nicks: There are no players to assign nicks to.","color":"red"}

# create queues for name pool and current players
data modify storage mb:registers name_pool_queue set from storage mb:data game.name_pool
data modify storage mb:registers current_players_queue set from storage mb:data game.current_players

# setup arguments../relo
data merge storage mb:registers {args:{name_pool_index:0,player:[]}}
data modify storage mb:registers args.player set from storage mb:registers current_players_queue[0].UUID

# get random index from name pool queue...
# get pool queue size...
execute store result storage util:registers args.value int 1.0 run function util:internal/get_array_size {storage:"mb:registers",nbt:"name_pool_queue"}
# generate random index into args...
execute store result storage mb:registers args.name_pool_index int 1.0 run function util:get_random_array_index

# call recursive assign nicks...
function mb:gm/internal/assign_nicks with storage mb:registers args