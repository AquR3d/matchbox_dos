# this function resets every tallied vote on each current player and resets the tallied votes array...

# clear skipped vote count...
scoreboard players set $skip_vote mb.data 0

# check if current players exists..
execute unless data storage mb:data game.current_players[] run return fail

# otherwise, we need to go through each current player and reset their votes value...
# create queue...
data modify storage mb:registers current_players_queue set from storage mb:data game.current_players

# go through each one and set their value..
function mb:gm/internal/reset_tallied_votes with storage mb:registers current_players_queue[0]