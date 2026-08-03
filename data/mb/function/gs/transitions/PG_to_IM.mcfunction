# transition from pre-game to in map... this one is LOONG.

# we do 3 checks...

# check if there are enough players...
# if there are not at least 3 players... return
execute unless data storage mb:data game.current_players[1] run return run \
tellraw @s {"text":"mb:gs/transitions/pg_to_im: There are not enough players to start.","color":"red"}

# next we check if there are enough names in the name pool...
execute store result score $s0 util run function util:internal/get_array_size {storage:"mb:data",nbt:"game.current_players"}
execute store result score $s1 util run function util:internal/get_array_size {storage:"mb:data",nbt:"game.name_pool"}

# if $s0 > $s1, RETURN not enough names...
execute if score $s0 util > $s1 util run return run \
tellraw @s {"text":"mb:gs/transitions/pg_to_im: There are not enough names in the NAME_POOL.","color":"red"}

# okay now that these checks are done... we setup game!

function mb:gm/setup_game

# and then we start the round.

# round start...
function mb:gs/internal/round_start