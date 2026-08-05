# just move from deceased to current and get rid of spectator uuid...

# if it doesn't exist in deceased ggs nt no reviving...
$execute unless data storage mb:data game.deceased_players[{UUID:$(UUID)}] run return run \
tellraw @s {"text":"mb:debug/internal/revive_player: Player was not detected as deceased in the game.  Try adding this player instead.","color":"red"}

$execute if data storage mb:data game.current_players[{UUID:$(UUID)}] run return run \
tellraw @s {"text":"mb:debug/internal/revive_player: Player is already in the game, but was also detected as deceased.","color":"red"}

# change deceased to current players...
# modify death state to false ig?
$data modify storage mb:data game.deceased_players[{UUID:$(UUID)}].dead set value false
$data modify storage mb:data game.current_players append from storage mb:data game.deceased_players[{UUID:$(UUID)}]
$data remove storage mb:data game.deceased_players[{UUID:$(UUID)}]
# remove from spectators...
$data remove storage mb:data game.spectators[{UUID:$(UUID)}]