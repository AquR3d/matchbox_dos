# only edits the time of a timer that hasn't ran yet lol

# if doesn't exist, say so
$execute unless data storage timer:data timer_ids[{id:"$(id)"}] run return run \
tellraw @s {"text":"time:edit_time_of_timer: This timer ID was not found.  Try making a timer with this timer ID first!","color":"red"}

# modify time
$data modify storage timer:data timer_ids[{id:"$(id)"}].time set value $(time)