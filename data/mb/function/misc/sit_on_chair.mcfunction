# tag itself
tag @s add sit_on
# ride
execute as @s on target run ride @s mount @e[tag=sit_on,limit=1]
# remove data
tag @s remove sit_on
# clear interactions
data remove entity @s interaction
