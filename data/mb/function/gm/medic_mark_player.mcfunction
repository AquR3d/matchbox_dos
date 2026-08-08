# this function sets the data storage of this UUID as medic marked true..

$execute unless data storage mb:data game.current_players[{UUID:$(UUID)}] run return fail

# otherwise modify data
$data modify storage mb:data game.current_players[{UUID:$(UUID)}].marked.medic set value true