# sets dead to value in ther player thing

# set used arrow to value:true/false macro...

# first check in game
execute unless function mb:gm/check_player_in_game run return run \
tellraw @s {"text":"mb:gm/set_used_arrow: Player does not exist in current players for the game.","color":"red"}

# setup args...
$data merge storage mb:registers {args:{UUID:[],value:$(value)}}
data modify storage mb:registers args.UUID set from entity @s UUID

function mb:gm/internal/set_dead with storage mb:registers args