# create copy of locations
$data modify storage util:registers args.spawn_locs_queue set from storage $(storage) $(nbt)
# do the thing
function util:internal/spawn_loc_recurs