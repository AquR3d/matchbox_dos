# if not in game ruh roh how did this happen
$execute unless data storage mb:data game.current_players[{UUID:$(UUID)}] run return run \
tellraw @s {"text":"mb:gm/reveal_player: Player UUID not detected in the game, so reveal failed.","color":"red"}

# clear glowing...
effect clear @s glowing

# unhide nametag...
function nicks:hide_nametag {hide:false}

# change their data...
$data modify storage mb:data game.current_players[{UUID:$(UUID)}].revealed set value true