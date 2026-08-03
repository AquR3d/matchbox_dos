# this function will just make everyone innocent.

# first check if there's anyone in curent players...
execute unless data storage mb:data game.current_players[] run return run \
tellraw @s {"text":"mb:gm/reset_roles: There are no current players to reset the roles of.","color":"red"}

# make player queue
data modify storage mb:registers current_players_queue set from storage mb:data game.current_players

# call with queue...
function mb:gm/internal/reset_roles with storage mb:registers current_players_queue[0]