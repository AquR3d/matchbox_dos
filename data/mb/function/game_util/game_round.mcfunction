# hide names again
# should nametags be revealed per round?
execute if data storage matchbox:data {custom:{reset_reveal_per_round:true}} run scoreboard players set @a[team=sigmas,scores={nicks=0..}] unrevealed 1
scoreboard players set $dont_show_all hide_nick 1
execute as @a[team=sigmas] run function mb:nametags/update_hide_nick
# turn off chat
data modify storage matchbox:data cmds.chat set value false
# teleport everyone
function mb:game/spawning/tp_to_spawns
# teleport spectators
execute as @a[team=betas] run function mb:game/spawning/tp_to_storage with storage matchbox:data spec_game_pos
# effects
effect clear @a[team=sigmas] invisibility
effect give @a[team=sigmas] weakness infinite 255 true
# turn on custom signs
data modify storage matchbox:data cmds.custom_signs set value true
# check dropped items
data modify storage matchbox:data cmds.check_give_back set value true
# check marking
data modify storage matchbox:data cmds.check_s_mark set value true
data modify storage matchbox:data cmds.check_m_mark set value true
# check swapping
data modify storage matchbox:data cmds.check_swap set value true
# check for used arrow
data modify storage matchbox:data cmds.check_arrow set value true
# glowing reveals
data modify storage matchbox:data cmds.glowing_reveals set value true
# check for missed arrow
execute if data storage matchbox:data {custom:{kill_missed_arrow:true}} run data modify storage matchbox:data cmds.check_missed_arrow set value true
# give spark mark cd back
execute if score $spark used_mark matches 1 run scoreboard players set $spark used_mark 0
# clear everyone then give items
execute as @a[team=sigmas,scores={nicks=0..,alive=1}] run clear @s
# give items
execute as @a[team=sigmas,scores={nicks=0..,alive=1}] run function mb:items/give_items
# start round timer
function mb:game/time/start_timer with storage matchbox:timer round_time