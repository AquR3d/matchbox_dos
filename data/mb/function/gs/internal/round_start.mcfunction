# starts the in map... resets signs... tp player... give items
# round start...

# clear oak signs...
function mb:gu/map/clear_oak_signs

# tp players...
function mb:gm/map/tp_players_to_map

# tp spectators...

# make team mb.sigmas friendly fire on
team modify mb.sigmas friendlyFire true

# clear items...
execute in overworld as @a if function mb:gm/check_player_in_game run clear @s

# give items...
execute in overworld as @a if function mb:gm/check_player_in_game run function mb:gu/items/give_items

# this is where we'd check if we wanted to reset the arrows again, anyways reset scoreboard
execute in overworld as @a if function mb:gm/check_player_in_game run \
scoreboard players reset @s mb.crossbow

# if player has not used an arrow, give them an arrow...
execute in overworld as @a if function mb:gm/check_player_in_game unless function mb:gm/get_player_used_arrow_data run \
function mb:gu/items/give_arrow

# reveal players who are revealed... here might add a custom thing
execute in overworld as @a if function mb:gm/check_player_in_game if function mb:gm/check_player_is_revealed run \
function mb:gm/reveal_player with entity @s