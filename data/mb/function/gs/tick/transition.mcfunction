# this is the tick function that is the transition from in map to in discussion....

# title @a actionbar {"text":"in transition..."}

# display their nick
execute in overworld as @a if function mb:gm/check_player_in_game run \
function mb:gm/display_nick_status with entity @s

# immobile movement

# give blindness...
execute in overworld as @a if function mb:gm/check_player_in_game run effect give @s blindness 2 1 true


# test for dc...

execute if function mb:gm/check_for_player_disconnect run function mb:gs/transitions/pause_game