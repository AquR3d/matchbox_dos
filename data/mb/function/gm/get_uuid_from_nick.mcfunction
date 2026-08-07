# this function will return the player uuid by nick..

# if not in players return.
$execute unless data storage mb:data game.current_players[{nick:"$(nick)"}] run return fail

# otherwise set return UUID to this...
$data modify storage mb:registers return.UUID set from storage mb:data game.current_players[{nick:"$(nick)"}].UUID