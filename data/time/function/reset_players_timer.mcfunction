# resets players who can see this timer bossbar...

# check if timer exists..
$execute unless data storage timer:data timer_ids[{id:"$(id)"}] run return fail

# set players to none
$data modify storage timer:data timer_ids[{id:"$(id)"}].players set value []

# set bossbar to none
$bossbar set $(id) players