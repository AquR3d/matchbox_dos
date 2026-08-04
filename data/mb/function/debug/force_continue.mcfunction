# if game state not paused ggs...

execute unless data storage mb:data {game:{current_game_state:"PAUSED"}} run return run \
tellraw @s {"text":"mb:debug/force_continue: The game was not detected as paused.  If you think this was an error, try running the following command.\
 /data modify storage mb:data game.disconnected_players set value []","color":"red"}

# otherwise, get rid of dc players...
data modify storage mb:data game.disconnected_players set value []