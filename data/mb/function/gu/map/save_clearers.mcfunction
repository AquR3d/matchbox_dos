# save clearers
execute as @e[type=armor_stand,tag=clearer_loc] run data modify storage mb:data map.clearer_locs append from entity @s Pos
# kill the clearer locs
kill @e[type=armor_stand,tag=clearer_loc]