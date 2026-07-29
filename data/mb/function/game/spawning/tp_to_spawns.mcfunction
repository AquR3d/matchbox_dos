# set people as candidates for tping
# needs the "spawn_in" tag...
#tag @a[team=sigmas,scores={nicks=0..}] add spawn_in
# spawn in armorstands on positions
function mb:game/spawning/spawn_locs
# start recursive tping
function mb:game/spawning/tp_to_spawn_recurs
# say tping ended
# remove tags
function mb:game/spawning/reset_tp_tags