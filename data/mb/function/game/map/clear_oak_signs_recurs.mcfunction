# if pos queue is cleared, stop
execute if data storage matchbox:data {clearer_locs_tmp:[]} run return fail
# for every position
summon armor_stand ~ ~ ~ {Tags:[to_clear]}
# edit data
data modify entity @e[type=armor_stand,tag=to_clear,limit=1] Pos set from storage matchbox:data clearer_locs_tmp[0]
# run fill commands, replaces a 3x3 chunk radius thats 14 blocks tall
execute at @e[type=armor_stand,tag=to_clear] run fill ~-16 ~-7 ~-16 ~31 ~6 ~31 air replace minecraft:oak_sign
execute at @e[type=armor_stand,tag=to_clear] run fill ~-16 ~-7 ~-16 ~31 ~6 ~31 air replace minecraft:oak_wall_sign
# get rid of tag. also technically both these tags dont matter i just need one... or just kill it lol
kill @e[type=armor_stand,tag=to_clear]
# pop pos from queue
data remove storage matchbox:data clearer_locs_tmp[0]
# do recurs
function mb:game/map/clear_oak_signs_recurs
