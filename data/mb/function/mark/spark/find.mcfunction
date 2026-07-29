#declare score_holder $s.max The highest entity score
scoreboard players set $s.max find_look.temp 0
#declare tag find_looking.s.candidate
#declare tag find_looking.s.result
tag @e remove find_looking.s.result
tag @a[tag=find_looking.s.candidate,team=sigmas] add find_looking.s.result
# Assign unique score to each entity
execute as @a[tag=find_looking.s.result,team=sigmas] store result score @s find_look.temp run scoreboard players add $s.max find_look.temp 1

#declare score_holder $s.filter The rule by which to filter entities
scoreboard players set $s.filter find_look.temp 0

#declare tag find_looking.s.in_filter
tag @e remove find_looking.s.in_filter
function mb:mark/spark/internal/filter/iteration

# mark them
# effect give @a[tag=find_looking.s.result,team=sigmas] glowing 1 1 true