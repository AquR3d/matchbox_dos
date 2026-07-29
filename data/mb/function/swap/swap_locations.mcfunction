# reset swap cd
scoreboard players set $spark swap 0
# choose person to tp to
tag @r[tag=!spark,team=sigmas] add swap
# tag @e[tag=!spark,sort=random,limit=1,type=armor_stand] add swap
# tp spark to random person
tp @s @a[limit=1,tag=swap]
# create a buffer location where the spark is
summon minecraft:armor_stand ~ ~ ~ {Tags:["buffer"]}
# tp random person to buffer
tp @e[tag=swap,limit=1] @e[tag=buffer,limit=1,type=armor_stand]
# kill buffer
kill @e[type=minecraft:armor_stand,tag=buffer]
# remove swap tag
tag @e[tag=swap] remove swap
# reset spark swap cooldown
# item replace entity @s container.13 with air
# start cooldown
function mb:swap/swap_time