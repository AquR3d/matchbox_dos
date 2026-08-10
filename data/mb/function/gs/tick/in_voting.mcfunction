
title @a actionbar {"text":"in voting"}




# display their nick
execute in overworld as @a if function mb:gm/check_player_in_game run \
function mb:gm/display_nick_status with entity @s




# test for dc...

execute if function mb:gm/check_for_player_disconnect run function mb:gs/transitions/pause_game