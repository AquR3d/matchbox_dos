# pause the timer by putting the timer into paused array in timer:data storage...

# but first, check if it's running in the first place....

$execute unless data storage timer:data running_timers[{idL:"$(id)"}] run return \
run tellraw @s {"text":"time:pause_timer: Could not find a running timer with this timer ID.","color":"red"}

# if it doest exist... put into paused array and get rid of it in running array.

$data modify storage tiemr:data paused_timers append from storage timer:data running_timers[{id:"$(id)"}]
$data remove storage timer:data running_timers[{id:"$(id)"}]