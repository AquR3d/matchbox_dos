# kill any items that are give back
kill @e[type=item,nbt={Item:{tag:{give_back:1b}}}]
# clear effects
function mb:misc/norm_movement
execute as @a[team=sigmas,scores={alive=1}] run effect clear @s
# tp everyone to discussion room
# errrrrrm i'll think about this later YOU NEED ARMORSTANDS WITH THE TAG CHAIR AND SCORED 0 TRHOUGH 9
function mb:game/spawning/tp_to_chairs
# clear signs
function mb:game/map/clear_oak_signs
# give weakness again
effect give @a weakness infinite 255 true
# turn on nametags if customization is true
execute if data storage matchbox:data {custom:{show_nametags_during_discussion:true}} run \
function mb:nametags/reveal_all
execute if data storage matchbox:data {custom:{show_nametags_during_discussion:false}} run \
function mb:nametags/force_hide_all
# turn on chat
data modify storage matchbox:data cmds.chat set value true
# clear inventories
execute as @a[team=sigmas,scores={nicks=0..,alive=1}] run clear @s
# give chat thing
execute as @a[team=sigmas,scores={nicks=0..,alive=1}] as @s run function mb:items/give_chat
# state who has died or if no one has
function mb:game/misc/state_death
# kill person who is marked by spark could trigger end game
execute as @a[team=sigmas,scores={nicks=0..,alive=1},tag=s.mark,tag=!m.mark] run function mb:game/misc/kill_marked
# store spark count
execute store result score $spark_count nicks if entity @a[team=sigmas,tag=spark]
# if no more spark...
execute if score $spark_count nicks matches ..0 run return run function mb:game/commands/innocent_win
# tp all spectators to discussion room
execute as @a[team=betas] run function mb:game/spawning/tp_to_storage with storage matchbox:data spec_discussion_pos
# if someone was saved, state that they have been saved only to the saved person
execute as @a[tag=s.mark,tag=m.mark] run tellraw @s [{"text":"You have been saved by the medic. "},{"text":"No one else knows this.","color":"red"}]
# remove marked tags
tag @a[tag=s.mark] remove s.mark
tag @a[tag=m.mark] remove m.mark
# start discussion timer
function mb:game/time/start_timer with storage matchbox:timer discussion_time
