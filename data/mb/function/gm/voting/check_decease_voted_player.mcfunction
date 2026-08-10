# checkfs if we need to decease a voted player...

execute unless data storage mb:data {game:{voting:{vote_state:"VOTE"}}} run return fail

# run say
# say attempting to vote off person...

# set return to []...
data merge storage mb:registers {return:{UUID:[]}}
# deceases the voted player in game.voting.nick...
function mb:gm/get_uuid_from_nick with storage mb:data game.voting
# check if uuid does not exist...
execute if data storage mb:registers {return:{UUID:[]}} run return fail

# otherwise copy
data modify storage mb:registers args.UUID set from storage mb:registers return.UUID

# decease this player
function mb:gm/internal/decease_player with storage mb:registers args