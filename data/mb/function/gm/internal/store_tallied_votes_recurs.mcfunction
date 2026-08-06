# this function doesn't even have to be a macro... cuz i can also just append from storage... whatever it's easily replaceable

# with this person in the queue... get the votes and append to array...
$data modify storage mb:data game.voting.tallied_votes append value $(votes)

# remove current queue...
data remove storage mb:registers current_players_queue[0]

# check if queue is empty..
execute unless data storage mb:registers current_players_queue[] run return fail

# otherwise run again with front of queue...
function mb:gm/internal/store_tallied_votes_recurs with storage mb:registers current_players_queue[0]