# we make this player dead...

# if doesn't exist in game... nothing to decease
execute unless function mb:gm/check_player_in_game run return fail

function mb:gm/internal/decease_player with entity @s