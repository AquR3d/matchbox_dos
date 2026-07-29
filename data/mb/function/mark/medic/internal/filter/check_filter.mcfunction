scoreboard players operation $m.selected find_look.temp = @s find_look.temp
scoreboard players operation $m.selected find_look.temp /= $m.filter find_look.temp
scoreboard players operation $m.selected find_look.temp %= 2 find_look.const
tag @s remove find_looking.m.in_filter
execute if score $m.selected find_look.temp matches 1 run tag @s add find_looking.m.in_filter
