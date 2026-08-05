# check if queue is empty...
execute unless data storage mb:registers current_players_queue[] run return fail

# otherwise, give paper with first one in queue...
function mb:gu/voting/give_paper with storage mb:registers current_players_queue[0]

# remove from storage...
data remove storage mb:registers current_players_queue[0]

# run again..
function mb:gu/internal/give_papers