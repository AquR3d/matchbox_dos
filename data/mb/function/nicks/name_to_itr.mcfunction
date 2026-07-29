# if no more candidates
execute unless entity @a[tag=nick.candidate] run return fail
# if reached max
execute if score $iterator nicks >= $max nicks run return fail
# if more candidates
# assign thing
scoreboard players operation @s nicks = $iterator nicks
tag @s remove nick.candidate