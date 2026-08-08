# reset this uuid marked
# check if queue is empty
execute unless data storage mb:registers current_players_queue[] run return fail

$data modify storage mb:data game.current_players[{UUID:$(UUID)}].marked set value {spark:false,medic:false}

# go next
data remove storage mb:registers current_players_queue[0]

# go next
function mb:gm/internal/reset_all_marked with storage mb:registers current_players_queue[0]