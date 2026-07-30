# we put the timer in running timers.

# but first we check if the timer id exists...

$execute unless data storage timer:data timer_ids[{id:"$(id)"}] run return run tellraw @s {"text":"time:start_timer: This timer ID does not exist.","color":"red"}

# if the timer is already running or paused ... stop
$execute if data storage timer:data running_timers[{id:"$(id)"}] run return run \
tellraw @s {"text":"time:start_timer: This timer ID is already running.","color":"red"}
$execute if data storage timer:data paused_timers[{id:"$(id)"}] run return run \
tellraw @s {"text":"time:start_timer: This timer ID is currently paused.  Try using the unpause function instead.","color":"red"}

# if the timer has not been running or paused but the ID does exist... add to running timers...

$data modify storage timer:data running_timers append from storage timer:data timer_ids[{id:"$(id)"}]

# that's it...