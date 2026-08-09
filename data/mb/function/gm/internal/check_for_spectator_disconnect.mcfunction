# check if uuid exists...

# just remove from spectator storage if doesn't exist
$execute unless entity @a[nbt={UUID:$(UUID)}] run data remove storage mb:data game.spectators[{UUID:$(UUID)}]
$execute unless entity @a[nbt={UUID:$(UUID)}] run data modify storage mb:registers return.value set value true

# remove from queue...
$data remove storage mb:registers spectators_queue[{UUID:$(UUID)}]

# check if queue is empty...
execute unless data storage mb:registers spectators_queue[] run return fail

# otherwise, go again...
function mb:gm/internal/check_for_spectator_disconnect with storage mb:registers spectators_queue[0]