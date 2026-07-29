# on any player that has joined the world...
# remove from team
team leave @s
# remove any tags
tag @s[tag=spark] remove spark
tag @s[tag=medic] remove medic
# set scoreboard value
scoreboard players set @s alive 0
# clear inventory
clear @s
# tp to spawn
function mb:game/spawning/tp_to_storage with storage matchbox:data lobby_pos
# set to adventure
gamemode adventure @s
# changed joined score
scoreboard players set @s joined 0