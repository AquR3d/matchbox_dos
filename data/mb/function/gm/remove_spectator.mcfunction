# run internal... first check if is spectator

execute unless function mb:gm/check_is_spectator run return run \
tellraw @s {"text":"mb:gm/remove_spectator: The game detected this UUID as not a spectator, so there was nothing to remove.","color":"red"}

function mb:gm/internal/remove_spectator with entity @s