scoreboard players operation $s.selected find_look.temp = @s find_look.temp
scoreboard players operation $s.selected find_look.temp /= $s.filter find_look.temp
scoreboard players operation $s.selected find_look.temp %= 2 find_look.const
tag @s remove find_looking.s.in_filter
execute if score $s.selected find_look.temp matches 1 run tag @s add find_looking.s.in_filter
