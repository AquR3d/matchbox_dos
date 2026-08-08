# save interaction in data...

# if from doesn't exist, do this
$execute unless data storage util:data player_interactions[{from:$(from)}] run return run \
data modify storage util:data player_interactions append value {from:$(from),to:$(to)}

# if from exists, do this...
$data modify storage util:data player_interactions[{from:$(from)}].to set value $(to)