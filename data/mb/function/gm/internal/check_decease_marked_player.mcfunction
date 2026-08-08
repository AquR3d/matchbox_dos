# here we check if we need to decease someone who is marked by the spark...

# first we check if theres more than 1 for some reason...
execute store result score $num_marked mb.data run execute if data storage mb:data game.current_players[{marked:{spark:true}}]

# if 0, just return fail
execute if score $num_marked mb.data matches 0 run return fail
# if it's somehow more than 1... erm error
execute if score $num_marked mb.data matches 2.. run return \
run tellraw @a {"text":"mb:gm/internal/check_decease_marked_player: Game detected 2 marked players, which is not supposed to happen. ERROR 2","color":"red"}

# otherwise it's 1 :D, decease them

# but first.. check if medic saved them... will prolly add medic saved them thing
execute if data storage mb:data game.current_players[{marked:{spark:true,medic:true}}] run \
execute in overworld as @a if function mb:gm/check_player_is_spark_marked run return run \
tellraw @s {"text":"u have been saved by the medic lol that means u were also spark marked"}

# otherwise, bro is gonna be deceased

# setup args
data merge storage mb:registers {args:{UUID:[]}}
data modify storage mb:registers args.UUID set from storage mb:data game.current_players[{marked:{spark:true}}].UUID

# decease player
function mb:gm/internal/decease_player with storage mb:registers args