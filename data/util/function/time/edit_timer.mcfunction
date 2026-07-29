# edit a timer in the timers queue with the id
$execute if data storage matchbox:timer timers[{id:"$(id)"}] run \
data modify storage matchbox:timer timers[{id:"$(id)"}].value set value $(value)
$execute unless data storage matchbox:timer timers[{id:"$(id)"}] run \
tellraw @s [{"text":"Failed to edit timer \"$(id)\"","color":"red"}]