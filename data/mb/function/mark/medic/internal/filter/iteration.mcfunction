# Executes a single m.filter iteration and calls the next one
#say hi @e[tag=find_looking.m.result]
execute if score $m.filter find_look.temp matches 1.. as @e[tag=find_looking.m.candidate,tag=find_looking.m.result] run function mb:mark/medic/internal/filter/check_filter
execute if score $m.filter find_look.temp matches 0 run tag @e[tag=find_looking.m.candidate,tag=find_looking.m.result] add find_looking.m.in_filter

execute store success score $m.success find_look.temp if predicate mb:looking/can_see_m_filter

execute if score $m.success find_look.temp matches 0 run tag @e[tag=find_looking.m.candidate,tag=find_looking.m.in_filter] remove find_looking.m.result
execute if score $m.success find_look.temp matches 1 run tag @e[tag=find_looking.m.candidate,tag=!find_looking.m.in_filter] remove find_looking.m.result

scoreboard players operation $m.filter find_look.temp *= 2 find_look.const
execute if score $m.filter find_look.temp matches 0 run scoreboard players set $m.filter find_look.temp 1

execute if entity @e[tag=find_looking.m.candidate,tag=find_looking.m.result,limit=1] if score $m.filter find_look.temp <= $m.max find_look.temp run function mb:mark/medic/internal/filter/iteration
