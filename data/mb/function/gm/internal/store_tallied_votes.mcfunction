# this function will store the tallied votes of each player into the tallied_votes array...

# first check i the player list is empty...
execute unless data storage mb:data game.current_players[] run return fail

# clear tallied votes array.
data modify storage mb:data game.voting.tallied_votes set value [I;]

# add scoreboard skip vote count... to talliied votes array
execute store result storage mb:registers args.value int 1.0 run scoreboard players get $skip_vote mb.data
data modify storage mb:data game.voting.tallied_votes append from storage mb:registers args.value

# create player queue...
data modify storage mb:registers current_players_queue set from storage mb:data game.current_players

# call internal function with first on ein queue
function mb:gm/internal/store_tallied_votes_recurs with storage mb:registers current_players_queue[0]