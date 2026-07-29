# turn off marking and swapping
data modify storage matchbox:data cmds.check_s_mark set value false
data modify storage matchbox:data cmds.check_m_mark set value false
data modify storage matchbox:data cmds.check_swap set value false
# turn off checking dropped items
data modify storage matchbox:data cmds.check_give_back set value false
# kill any marking interaction boxes
kill @e[type=interaction,tag=s.int]
kill @e[type=interaction,tag=m.int]
# turn off arrow mechanics
data modify storage matchbox:data cmds.glowing_reveals set value false
data modify storage matchbox:data cmds.check_arrow set value false
data modify storage matchbox:data cmds.check_missed_arrow set value false
# make everyone immobile and blindness
# apprently 128 jump boost disables jumping ig lol
execute as @a[team=sigmas,scores={nicks=0..}] run function mb:misc/immobile
# start end round timer
function mb:game/time/start_timer with storage matchbox:timer end_round_time
