# if empty no
execute unless data storage mb:data game.current_players[] run return fail

# create queue...
data modify storage mb:registers current_players_queue set from storage mb:data game.current_players

# run internal
function mb:gm/internal/reset_all_marked with storage mb:registers current_players_queue[0]