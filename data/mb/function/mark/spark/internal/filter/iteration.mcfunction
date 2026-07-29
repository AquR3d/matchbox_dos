# Executes a single filter iteration and calls the next one
#say hi @e[tag=find_looking.s.result]
execute if score $s.filter find_look.temp matches 1.. as @e[tag=find_looking.s.candidate,tag=find_looking.s.result] run function mb:mark/spark/internal/filter/check_filter
execute if score $s.filter find_look.temp matches 0 run tag @e[tag=find_looking.s.candidate,tag=find_looking.s.result] add find_looking.s.in_filter

execute store success score $s.success find_look.temp if predicate mb:looking/can_see_s_filter

execute if score $s.success find_look.temp matches 0 run tag @e[tag=find_looking.s.candidate,tag=find_looking.s.in_filter] remove find_looking.s.result
execute if score $s.success find_look.temp matches 1 run tag @e[tag=find_looking.s.candidate,tag=!find_looking.s.in_filter] remove find_looking.s.result

scoreboard players operation $s.filter find_look.temp *= 2 find_look.const
execute if score $s.filter find_look.temp matches 0 run scoreboard players set $s.filter find_look.temp 1

execute if entity @e[tag=find_looking.s.candidate,tag=find_looking.s.result,limit=1] if score $s.filter find_look.temp <= $s.max find_look.temp run function mb:mark/spark/internal/filter/iteration
