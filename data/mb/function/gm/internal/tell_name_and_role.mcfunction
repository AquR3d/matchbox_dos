# just prints saying their name and role...

# say name
$tellraw @s [{"text":"Your name is ","color":"yellow"},{"text":"$(nick)","color":"white"},{"text":".","color":"yellow"}]

# say role...
$execute if data storage mb:data game.current_players[{UUID:$(UUID),role:"INNOCENT"}] run return run \
tellraw @s [{"text":"You are an ","color":"gray"},{"text":"INNOCENT","color":"green"},{"text":".","color":"gray"}]

$execute if data storage mb:data game.current_players[{UUID:$(UUID),role:"SPARK"}] run return run \
tellraw @s [{"text":"You are the ","color":"gray"},{"text":"SPARK","color":"yellow"},{"text":".","color":"gray"}]

$execute if data storage mb:data game.current_players[{UUID:$(UUID),role:"MEDIC"}] run return run \
tellraw @s [{"text":"You are the ","color":"gray"},{"text":"MEDIC","color":"blue"},{"text":".","color":"gray"}]