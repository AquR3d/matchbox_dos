# called from check player in game not in the internal

# check the array for uuid...
$return run execute if data storage mb:data game.current_players[{UUID:$(UUID)}]