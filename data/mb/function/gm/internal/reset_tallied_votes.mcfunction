# reset this uuid...

$function mb:gm/voting/reset_my_tallied_votes {UUID:$(UUID)}

# delete from queue...
data remove storage mb:registers current_players_queue[0]

# check if empty...
execute unless data storage mb:registers current_players_queue[] run return fail

# otherwise, go again
function mb:gm/internal/reset_tallied_votes with storage mb:registers current_players_queue[0]