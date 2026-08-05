# stop any round timers
function mb:game/time/stop_timer
# make every spectator and player normally
clear @a
team leave @a
execute as @a run gamemode adventure @s
# remove tags
tag @a[tag=s.mark] remove s.mark
tag @a[tag=m.mark] remove m.mark
tag @a[tag=spark] remove spark
tag @a[tag=medic] remove medic
# turn off effects
effect clear @a
# clear signs
function mb:game/map/clear_oak_signs
# say cleared map
tellraw @a [{"text":"Map has been cleared of oak signs."}]
# turn off stuff
data merge storage matchbox:data {cmds:{player_count:false}}
data merge storage matchbox:data {cmds:{check_swap:false}}
data merge storage matchbox:data {cmds:{check_s_mark:false}}
data merge storage matchbox:data {cmds:{check_m_mark:false}}
data merge storage matchbox:data {cmds:{chat:false}}
data merge storage matchbox:data {cmds:{check_give_back:false}}
data merge storage matchbox:data {cmds:{check_arrow:false}}
data merge storage matchbox:data {cmds:{check_missed_arrow:false}}
data merge storage matchbox:data {cmds:{glowing_reveals:false}}
data merge storage matchbox:data {cmds:{tp_nametags:false}}
# show advancements again
gamerule announceAdvancements true
# reset scores DO NOT RESET NICKS
scoreboard players reset * alive
# kill text displays
kill @e[type=text_display,scores={nametags=0..}]
# kill any marking interaction entities
kill @e[type=interaction,tag=s.int]
kill @e[type=interaction,tag=m.int]
# teleport everyone to lobby
execute as @a run function mb:game/spawning/tp_to_storage with storage matchbox:data lobby_pos