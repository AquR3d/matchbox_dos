# we check if the timer is in paused... which implies it's not in running... i hope.

$execute unless data storage timer:data paused_timers[{id:"$(id)"}] run return run \
tellraw @s {"text":"time:unpause_timer: This timer ID has not been detected of having state: PAUSED. Therefore, nothing happened.","color":"red"}

# now we know it's been paused, we just add back to running timers from paused and get rid of it in paused storage...
$data modify storage timer:data running_timers append from storage timer:data paused_timers[{id:"$(id)"}]
$data remove storage timer:data paused_timers[{id:"$(id)"}]

