# check if already in deceased...

$execute if data storage mb:data game.deceased_players[{UUID:$(UUID)}] run return fail

# set their thing to dead...
$data modify storage mb:data game.current_players[{UUID:$(UUID)}].dead set value true

# otherwise, add to deceased and spectator.. and remove from current
$data modify storage mb:data game.deceased_players append from storage mb:data game.current_players[{UUID:$(UUID)}]
$execute unless data storage mb:data game.spectators[{UUID:$(UUID)}] run \
data modify storage mb:data game.spectators append from storage mb:data game.current_players[{UUID:$(UUID)}]
$data remove storage mb:data game.current_players[{UUID:$(UUID)}]

gamemode spectator @s