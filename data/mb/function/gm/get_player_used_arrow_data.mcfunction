# checks the used arrow status in data storage...

# first check if player exists...

execute unless function mb:gm/check_player_in_game run return run \
tellraw @s {"text":"mb:gm/get_player_used_arrow_data: This player UUID does not exist in CURRENT_PLAYERS.","color":"red"}

return run function mb:gm/internal/get_player_used_arrow_data with entity @s