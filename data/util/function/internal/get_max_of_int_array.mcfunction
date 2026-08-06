# copy data...

$data modify storage util:registers queue set from storage $(storage) $(nbt)

# if empty return fail...
execute unless data storage util:registers queue[] run return fail

# save $s1 register....
function util:internal/store_saved_register_on_stack {register:"$s0"}

# set $s0 to temporary max as the first element...
execute store result score $s0 util run data get storage util:registers queue[0]

# call internal recursive thing...
function util:internal/get_max_of_int_array_recurs

# save max on $t0 rq...
scoreboard players operation $t0 util = $s0 util

# load $s1 register....
function util:internal/load_saved_register_on_stack {register:"$s0"}

# reutrn $t0
return run scoreboard players get $t0 util