# go through the current players...

# if queue empty ggs
execute unless data storage mb:registers current_players_queue[] run return fail

function mb:gm/internal/print_survived_player with storage mb:registers current_players_queue[0]

data remove storage mb:registers current_players_queue[0]

function mb:gm/internal/print_survived_players