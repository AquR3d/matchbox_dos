# this will create a timer that will create an event.

# get id $(id) as macro for timer...

# check if timer already exists...

$execute if data storage timer:data timer_ids[{id:"$(id)"}] run return run tellraw @s {"text":"This timer ID already exists!  Try a different ID instead.","color":"red"}

# add bossbar.
$bossbar add $(id) "AMONG US."

# add to storage...
$data modify storage timer:data timer_ids append value {id:"$(id)",time:$(time),event_cmd:"$(event_cmd)"}
