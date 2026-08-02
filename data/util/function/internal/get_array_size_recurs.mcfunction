# check if array is empty... and return if so
execute unless data storage util:registers args.value[] run return run data get storage util:registers return.value

# otherwise, remove one from array queue and add one.
data remove storage util:registers args.value[0]

# setup args
data merge storage util:registers {args:{a:0,b:1,op:"+="}}
# get return value and add 1
execute store result storage util:registers args.a int 1.0 run data get storage util:registers return.value
execute store result storage util:registers return.value int 1.0 run function util:math/scoreboard_operation

# go next...
return run function util:internal/get_array_size_recurs

