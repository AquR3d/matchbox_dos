# with macro, set the current players at this index to the spark...
# and delete player from queue to prevent beng picked again

$data modify storage mb:data game.current_players[{UUID:$(UUID)}].role set value "MEDIC"

# remove from player queue this UUID
$data remove storage mb:registers current_players_queue[{UUID:$(UUID)}]