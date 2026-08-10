# this is the pre_game tick function!  the thing that will be running whilst the game is in pre-game state...

title @a actionbar [{"text":"Matchbox","color":"red"},{"text":" Datapack & Plugin","color":"gray"},{"text":" by ","color":"white"},\
{"text":"AquR3d","color":"aqua"},{"text":" on ","color":"white"},{"text":"You","color":"white"},{"text":"Tube","color":"red"}]

# we check if a player dcd...

# store current player count
execute store result score $player_count mb.data if entity @a
# if it's same than the previous player count, then do return and do nothing...
execute if score $prev_player_count mb.data = $player_count mb.data run return fail
# we check if someone joined instead, if so, return but reset prev player count
execute if score $prev_player_count mb.data < $player_count mb.data run return run scoreboard players operation $prev_player_count mb.data = $player_count mb.data

# otherwise, update prev player count and continue.
scoreboard players operation $prev_player_count mb.data = $player_count mb.data

# we check if a player that has readied up had dcd...
# create a player queue to check each current player...
data modify storage mb:registers current_players_queue set from storage mb:data game.current_players

# go through all of them.
function mb:gs/internal/pre_game with storage mb:registers current_players_queue[0]

