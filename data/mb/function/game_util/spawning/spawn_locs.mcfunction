# create copy of locations
data modify storage matchbox:data spawn_locs_tmp set from storage matchbox:data spawn_locs
# do the thing
function mb:game/spawning/spawn_loc_recurs