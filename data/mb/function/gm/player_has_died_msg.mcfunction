# tellraw player has died message...

$execute in overworld as @a if function mb:gm/check_player_in_game run \
title @s title {"text":"$(nick) has died.","color":"#880000"}