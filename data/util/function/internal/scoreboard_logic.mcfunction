# arguments a, logical op (lop), b

# setup return
data merge storage util:registers {return:{value:0}}
# does $(a) = $(b)? provided they are ints (scoreboard)
#$say a: $(a)
$scoreboard players set $t0 util $(a)
#$say b: $(b)
$scoreboard players set $t1 util $(b)
# perform logical operator and put into return value... and return it ig
$execute store result storage util:registers return.value int 1.0 run execute if score $t0 util $(lop) $t1 util

# reutnr
return run data get storage util:registers return.value