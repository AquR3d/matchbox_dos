# setup return
data merge storage util:registers {return:{value:0}}
# does $(a) = $(b)? provided they are ints (scoreboard)
#$say a: $(a)
$scoreboard players set $t0 util $(a)
#$say b: $(b)
$scoreboard players set $t1 util $(b)
# unless they are not equal, store value 0
execute unless score $t0 util = $t1 util run return run data modify storage util:registers return.value set value 0
# else store value 1
data modify storage util:registers return.value set value 1