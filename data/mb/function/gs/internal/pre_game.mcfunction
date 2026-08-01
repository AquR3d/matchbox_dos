# recursively go through all the current players and check if their UUID exists...

# check if empty base case...
execute unless data storage mb:registers current_players_queue[] run return fail

# setup args...
$data merge storage util:registers {args:{UUID:$(UUID)}}
# if uuid does not exist, remove from storage...
$execute unless function util:uuid_exists run function mb:gm/internal/remove_player {UUID:$(UUID)}

# remove from queue
data remove storage mb:registers current_players_queue[0]

# start with other one
function mb:gs/internal/pre_game with storage mb:registers current_players_queue[0]