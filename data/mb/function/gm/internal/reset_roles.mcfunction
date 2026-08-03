# set this person's role to innocent...

$data modify storage mb:data game.current_players[{UUID:$(UUID)}].role set value "INNOCENT"

# remove form queue..
$data remove storage mb:registers current_players_queue[{UUID:$(UUID)}]

# ask our base case if there are no more in the queue
execute unless data storage mb:registers current_players_queue[] run return fail

# execute again with next player in queue
function mb:gm/internal/reset_roles with storage mb:registers current_players_queue[0]