# set $t0 and $t1 to macros a and b respectively...

$scoreboard players set $t0 util $(a)
$scoreboard players set $t1 util $(b)

# setup return value...
data merge storage util:registers {return:{value:0}}

# perform scoreboard operation AND store in return value for util.
$execute store result storage util:registers return.value int 1.0 run scoreboard players operation $t0 util $(op) $t1 util

# retunr the retunr vlaue ig...
return run data get storage util:registers return.value

