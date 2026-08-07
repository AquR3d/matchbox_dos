# basically swame as map, but different storage...
# set every player who's in the game spawn in...

execute in overworld as @a if function mb:gm/check_player_in_game run function util:map/set_spawn_in_candidate

# teleport.

function util:internal/tp_to_spawns {storage:"mb:data",nbt:"map.voting_locs"}


# add teleport spectators...