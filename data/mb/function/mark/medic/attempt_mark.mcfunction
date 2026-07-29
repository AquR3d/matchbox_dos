# print
#say "medic attempted mark"
# kill any interactions that may block the fiilter
kill @e[type=interaction,tag=m.int]
kill @e[type=interaction,tag=s.int]
# run find commands
# get rid of glowing temporary test
# effect clear @a glowing
# reset interaction
execute as @e[type=minecraft:interaction,tag=m.int] run data remove entity @s interaction
# run find commands
execute as @a[tag=medic] at @s run tag @a[tag=!medic,distance=..3] add find_looking.m.candidate
execute as @a[tag=medic] run function mb:mark/medic/find
tag @a remove find_looking.m.candidate
# if no result... return
execute unless entity @a[team=sigmas,tag=find_looking.m.result] run return run tellraw @s [{"text":"Mark failed.","color":"red"}]
# if exists, then mark them
execute as @a[tag=find_looking.m.result] run tag @s add m.mark
# for testing
# execute as @a[tag=m.mark] run say "i've been marked by the medic"
execute if entity @a[tag=m.mark] run scoreboard players set $medic used_mark 1
execute if entity @a[tag=m.mark] run tellraw @s [{"text":"You have marked someone.","color":"#33BBFF"}]

# remove any extra tags
tag @e remove find_looking.m.result
tag @e remove find_looking.m.in_filter