# run internal function with entity uuid

# check if player exists...
execute unless function mb:gm/check_player_in_game run return fail

# run internal function to get voting paper...
function mb:gm/internal/get_vote with entity @s