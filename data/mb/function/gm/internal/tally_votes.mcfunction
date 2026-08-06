# tally this person's vote...
$function mb:gm/voting/tally_my_vote {UUID:$(UUID)}

# remove from queue
data remove storage mb:registers current_players_queue[0]

# check if queue is empty...
execute unless data storage mb:registers current_players_queue[] run return fail

# otherwise go next...
function mb:gm/internal/tally_votes with storage mb:registers current_players_queue[0]