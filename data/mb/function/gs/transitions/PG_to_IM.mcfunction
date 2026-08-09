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

# starts the in map... resets signs... tp player... give items, create timer...
# round start...
function mb:gs/internal/round_start
# setup args...
data merge storage mb:registers {args:{id:"mb.in_map",time:200,event_cmd:"function mb:gs/transitions/im_to_transition"}}
# we scale by 20 for tick time, scoreboard should have seconds...
execute store result storage mb:registers args.time int 20.0 run scoreboard players get $in_map mb.time

function time:create_timer with storage mb:registers args

# shwo timer to all...
execute as @a if function mb:gm/check_player_in_game run function time:show_timer_to_player {id:"mb.in_map"}

# start timer...
function time:start_timer {id:"mb.in_map"}

# change game state...
data modify storage mb:data game.current_game_state set value "IN_MAP"