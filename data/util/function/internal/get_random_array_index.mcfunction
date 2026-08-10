# generates random index with array size...

data merge storage util:registers {args:{a:0,b:-1,op:"+="}}
$execute store result storage util:registers args.a int 1.0 run random value 1..$(value)

# subtract 1 from result to format.

execute store result storage util:registers return.value int 1.0 run return run function util:math/scoreboard_operation

