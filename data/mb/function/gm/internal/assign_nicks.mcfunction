# now we recursively assign names...

# assign name to this UUID of this name pool at name pool index...
$data modify storage mb:data game.current_players[{UUID:$(player)}].nick set from storage mb:registers name_pool_queue[$(name_pool_index)]

# remove from queue the name and player.
$data remove storage mb:registers current_players_queue[{UUID:$(player)}]
$data remove storage mb:registers name_pool_queue[$(name_pool_index)]

# $say removed $(player) from queue

# check if there are still players... if not, no more players to assign!
execute unless data storage mb:registers current_players_queue[] run return fail

# say still some in queue...

# setup arguments
data merge storage mb:registers {args:{name_pool_index:0,player:[]}}
data modify storage mb:registers args.player set from storage mb:registers current_players_queue[0].UUID

# generate new random index from name pool queue...
# get pool queue size...
execute store result storage util:registers args.value int 1.0 run function util:internal/get_array_size {storage:"mb:registers",nbt:"name_pool_queue"}
# generate random index into args...
execute store result storage mb:registers args.name_pool_index int 1.0 run function util:get_random_array_index

# re run!
function mb:gm/internal/assign_nicks with storage mb:registers args

