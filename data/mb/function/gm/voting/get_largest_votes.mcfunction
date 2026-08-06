# this function will store the largest votes in $max in mb.data

# first chcek if there are even players ig...
execute unless data storage mb:data game.current_players[] run return run \
tellraw @s {"text":"mb:gm/voting/get_largest_votes: There are no players, this function should only be used after successfully tallying votes of the players.","color":"red"}

# first we store the tallied votes...
function mb:gm/internal/store_tallied_votes

# now we calculate the max... and return...
return run function util:internal/get_max_of_int_array {storage:"mb:data",nbt:"game.voting.tallied_votes"}

# also keep in mind when we checking for a tie, we also check a tie with skip votes FIRST.