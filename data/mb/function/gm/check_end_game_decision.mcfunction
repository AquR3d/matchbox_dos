# this funciton stores in storage if the game should continue or end...

# if the spark doesn't exist, automaticaaly an innocent win
execute unless data storage mb:data game.current_players[{role:"SPARK"}] run return run \
data modify storage mb:data game.end_state set value "INNOCENT"

# now we check if there are >= sparks than innocents...
# add number of medics and innocents...
# load args...
data merge storage util:registers {args:{a:0,b:0,op:"+="}}
# get number of medics
execute store result storage util:registers args.a int 1.0 \
if data storage mb:data game.current_players[{role:"MEDIC"}]
# get number of innocents
execute store result storage util:registers args.b int 1.0 \
if data storage mb:data game.current_players[{role:"INNOCENT"}]
# add them and store again
execute store result storage util:registers args.b int 1.0 \
run function util:math/scoreboard_operation

# load args...
data merge storage util:registers {args:{lop:">="}}
# now we compare this number with number of sparks...
# get number of sparks...
execute store result storage util:registers args.a int 1.0 \
if data storage mb:data game.current_players[{role:"SPARK"}]
# compare numbers... a = spark  >=  b = innocents?
# if spark is greater than innocents... return set game end state to SPARK
execute if function util:logic/scoreboard_logic run return run \
data modify storage mb:data game.end_state set value "SPARK"

# if none of these, just set to continue...
data modify storage mb:data game.end_state set value "CONTINUE"