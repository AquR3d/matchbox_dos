# save spawns into storage...
# reset previous spawn locs
# got rid of reset
# get all the spawn locations
$execute as @e[tag=spawn_loc] run data modify storage $(storage) $(nbt) append from entity @s Pos
# kill all the armor stands
kill @e[tag=spawn_loc]