# this function takes the UUID of the player, and takes their vote
# and accumulates to their vote

# first check if this player exists...
$execute unless data storage mb:data game.current_players[{UUID:$(UUID)}] run return run \
tellraw @s {"text":"mb:gm/voting/tally_my_vote: The game has not detected this UUID as a current player, so their is no vote to tally.","color":"red"}

# if player did not vote, we add to 1 skip vote and go next...
$execute if data storage mb:data {game:{current_players:[{UUID:$(UUID),voted:false}]}} run return run \
scoreboard players add $skip_vote mb.data 1

# if player did vote, accumulate vote of this person...
$execute if data storage mb:data {game:{current_players:[{UUID:$(UUID),voted:true}]}} run \
function mb:gm/internal/tally_my_vote with storage mb:data game.current_players[{UUID:$(UUID)}]

# if the vote is invalid, the internal function will automatically say this player skipped vote