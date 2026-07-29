# handle summoning of interactions, if open hand and recipe book is open...
execute unless entity @e[tag=m.int] if score $medic used_mark matches 0 as \
@a[tag=medic,predicate=mb:mark/can_mark,predicate=!mb:nametags/is_sneaking] at @s run \
summon interaction ~ ~1.3 ~ {Tags:["m.int"],height:.5,width:.5}
execute unless entity @e[tag=m.int] if score $medic used_mark matches 0 as \
@a[tag=medic,predicate=mb:mark/can_mark,predicate=mb:nametags/is_sneaking] at @s run \
summon interaction ~ ~1 ~ {Tags:["m.int"],height:.5,width:.5}
# kill the interaction box if not needed, if they used the mark already, if not on an open hand, or the medic doesnt exist
# additional functionality, IF THE RECIPE BOOK ISNT OPEn no more marking
execute if entity @e[tag=m.int] unless entity @a[tag=medic] run return run kill @e[type=interaction,tag=m.int]
execute if entity @e[tag=m.int] if score $medic used_mark matches 1 run return run kill @e[type=interaction,tag=m.int]
execute if entity @e[tag=m.int] if entity @a[tag=medic,predicate=mb:mark/cant_mark] run return run kill @e[type=interaction,tag=m.int]

# if medic has open hand and can mark, teleport interaction
execute if score $medic used_mark matches 0 as @a[tag=medic,predicate=mb:mark/can_mark,predicate=!mb:nametags/is_sneaking] at @s run \
tp @e[limit=1,type=interaction,tag=m.int] ~ ~1.3 ~
# change tp location based on if crouching, im too lazy to make a separate function bc like why, i mean ig it's a waste with spamming the same first part of code
execute if score $medic used_mark matches 0 as @a[tag=medic,predicate=mb:mark/can_mark,predicate=mb:nametags/is_sneaking] at @s run \
tp @e[limit=1,type=interaction,tag=m.int] ~ ~1 ~