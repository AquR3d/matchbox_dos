# handle summoning of interactions
execute unless entity @e[tag=s.int] if score $spark used_mark matches 0 as \
@a[tag=spark,predicate=mb:mark/can_mark,predicate=!mb:nametags/is_sneaking] at @s run \
summon interaction ~ ~1.3 ~ {Tags:["s.int"],height:.5,width:.5}
execute unless entity @e[tag=s.int] if score $spark used_mark matches 0 as \
@a[tag=spark,predicate=mb:mark/can_mark,predicate=mb:nametags/is_sneaking] at @s run \
summon interaction ~ ~1 ~ {Tags:["s.int"],height:.5,width:.5}
# kill the interaction box if not needed, if they used the mark already, if not on an open hand, or the spark doesnt exist
execute if entity @e[tag=s.int] unless entity @a[tag=spark] run return run kill @e[type=interaction,tag=s.int]
execute if entity @e[tag=s.int] if score $spark used_mark matches 1 run kill @e[type=interaction,tag=s.int]
execute if entity @e[tag=s.int] if entity @a[tag=spark,predicate=mb:mark/cant_mark] run kill @e[type=interaction,tag=s.int]

# if spark has open hand and can mark, teleport interaction
execute if score $spark used_mark matches 0 as @a[tag=spark,predicate=mb:mark/can_mark,predicate=!mb:nametags/is_sneaking] at @s run \
tp @e[limit=1,type=interaction,tag=s.int] ~ ~1.3 ~
# change tp location based on if crouching, im too lazy to make a separate function bc like why, i mean ig it's a waste with spamming the same first part of code
execute if score $spark used_mark matches 0 as @a[tag=spark,predicate=mb:mark/can_mark,predicate=mb:nametags/is_sneaking] at @s run \
tp @e[limit=1,type=interaction,tag=s.int] ~ ~1 ~