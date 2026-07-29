#declare score_holder $m.max The highest entity score
scoreboard players set $m.max find_look.temp 0
#declare tag find_looking.m.candidate
#declare tag find_looking.m.result
tag @e remove find_looking.m.result
tag @a[tag=find_looking.m.candidate,team=sigmas] add find_looking.m.result
# Assign unique score to each entity
execute as @a[tag=find_looking.m.result,team=sigmas] store result score @s find_look.temp run scoreboard players add $m.max find_look.temp 1

#declare score_holder $m.filter The rule by which to filter entities
scoreboard players set $m.filter find_look.temp 0

#declare tag find_looking.m.in_filter
tag @e remove find_looking.m.in_filter
function mb:mark/medic/internal/filter/iteration

# mark them
