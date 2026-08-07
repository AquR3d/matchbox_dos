# if not in game ruh roh how did this happen
$execute unless data storage mb:data game.current_players[{UUID:$(UUID)}] run return run \
tellraw @s {"text":"mb:gm/reveal_player: Player UUID not detected in the game, so unreveal failed.","color":"red"}

# hide nametag...
function nicks:hide_nametag {hide:true}

# change their data...
$data modify storage mb:data game.current_players[{UUID:$(UUID)}].revealed set value false