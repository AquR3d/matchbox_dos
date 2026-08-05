# give arrows
scoreboard players set @a[team=sigmas] arrow 1
scoreboard players set @a[team=sigmas] unrevealed 1
scoreboard players set $dont_show_all hide_nick 1
scoreboard players set @a[team=sigmas] hide_nick 1
scoreboard players set @a[team=sigmas] alive 1
scoreboard players set $spark used_mark 0
scoreboard players set $medic used_mark 0
# clear any initial tags ig
tag @a[tag=spark] remove spark
tag @a[tag=medic] remove medic
# DO NOT RESET NICKS
# ASSIGN RANDOM NICKS (to people on team sigmas aka people who are playing)
function mb:nicks/random_names
# tell nicks
function mb:nicks/tell_nicks
# update chat names
function mb:chat/update_chat_names
# check player count for changing nametags
data modify storage matchbox:data cmds.player_count set value true
# reset advancement of ol betsy
advancement revoke @a only minecraft:adventure/ol_betsy
# dont allow advancements to show
gamerule announceAdvancements false
# give weakness to prevent punching
effect give @a[team=sigmas] weakness infinite 255 true
# check for dropped items
data modify storage matchbox:data cmds.check_give_back set value true
# teleport nametags
data modify storage matchbox:data cmds.tp_nametags set value true
# make spectator team into spectators
execute as @a[team=betas] run gamemode spectator @s
# make players in adventure
execute as @a[team=sigmas] run gamemode adventure @s
# clear inventory
execute as @a[team=sigmas] run clear @s
# tp spectators to game area
execute as @a[team=betas] run function mb:game/spawning/tp_to_storage with storage matchbox:data spec_game_pos
# make everyone invisible
effect give @a[team=sigmas,scores={nicks=0..}] invisibility infinite 1 true
# choose spark and medic
tag @r[team=sigmas,scores={nicks=0..}] add spark
tag @r[tag=!spark,team=sigmas,scores={nicks=0..}] add medic
# testing to see who is medic or spark
execute as @a[team=sigmas,tag=spark] run tellraw @s [{"text":"You are the spark.","color":"yellow"}]
execute as @a[team=sigmas,tag=medic] run tellraw @s [{"text":"You are the medic.","color":"#33BBFF"}]
# make everyone alive for voting
scoreboard players set @a[team=sigmas] alive 1
# teleport players into waiting areas
execute as @a[team=sigmas,tag=!spark] run function mb:game/spawning/tp_to_storage with storage matchbox:data wait_start
execute as @a[team=sigmas,tag=spark] run function mb:game/spawning/tp_to_storage with storage matchbox:data wait_swap
# tell everyone that we're waiting for swap key to be chosen
title @a actionbar [{"text":"Waiting for [SWAP_KEY] to be chosen by spark."}]