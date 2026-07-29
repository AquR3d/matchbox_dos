# print
# say "spark attempted mark"
# so basically it's wonky bc the other interaction entities BLOCk the filter, so we're actually js gonna kill both interaction boxes before we look for someone
# another problem, we cant right click it in the same tick this is summoned and is checked
kill @e[type=interaction,tag=m.int]
kill @e[type=interaction,tag=s.int]
# run find commands
# get rid of glowing temporary test
# effect clear @a glowing
execute as @a[tag=spark] at @s run tag @a[tag=!spark,distance=..3] add find_looking.s.candidate
execute as @a[tag=spark] run function mb:mark/spark/find
tag @a remove find_looking.s.candidate
# reset interaction
execute as @e[type=minecraft:interaction,tag=s.int] run data remove entity @s interaction
# if no result... return
execute unless entity @a[team=sigmas,tag=find_looking.s.result] run return run tellraw @s [{"text":"Mark failed.","color":"red"}]
# attempt
execute as @a[tag=find_looking.s.result,team=sigmas] run tag @s add s.mark
# for testing
# execute as @a[tag=s.mark] run say "i've been marked by the spark"
execute if entity @a[tag=s.mark] run scoreboard players set $spark used_mark 1
execute if entity @a[tag=s.mark] run tellraw @s [{"text":"You have marked someone.","color":"yellow"}]

# remove any extra tags
tag @e remove find_looking.s.result
tag @e remove find_looking.s.in_filter
