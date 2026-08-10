# this function prnts the survived player...

# if was the spark, do this print
$execute if data storage mb:data game.current_players[{UUID:$(UUID),role:"SPARK"}] run return run \
tellraw @a [{"text":"$(nick) ","color":"yellow"},\
{"text":"(","color":"gray"},{"selector":"@a[limit=1,nbt={UUID:$(UUID)}]","color":"gray"},{"text":") - ","color":"gray"},\
{"text":"SURVIVED","color":"green"}]

$execute if data storage mb:data game.current_players[{UUID:$(UUID),role:"MEDIC"}] run return run \
tellraw @a [{"text":"$(nick) ","color":"blue"},\
{"text":"(","color":"gray"},{"selector":"@a[limit=1,nbt={UUID:$(UUID)}]","color":"gray"},{"text":") - ","color":"gray"},\
{"text":"SURVIVED","color":"green"}]

$tellraw @a [{"text":"$(nick) ","color":"white"},\
{"text":"(","color":"gray"},{"selector":"@a[limit=1,nbt={UUID:$(UUID)}]","color":"gray"},{"text":") - ","color":"gray"},\
{"text":"SURVIVED","color":"green"}]