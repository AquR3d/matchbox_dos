#data merge storage matchbox:data {cmds:{\
    check_swap:false,check_s.mark:false,check_m.mark:false,custom_signs:true,check_missed_arrow:false,glowing_reveals:false,tp_nametags:false,chat:false,check_arrow:false,\
    check_dropped_voting:false,check_dropped_items:false,player_count:true\
#    }}
# check for commands we need to run
# when a player joins
execute if data storage matchbox:data {cmds:{joined:true}} as @a[team=sigmas,scores={joined=1..}] run function mb:game/spawning/player_join
# custom signs
execute if data storage matchbox:data {cmds:{custom_signs:true}} run function mb:items/dropped_sign_change
# player count also checks game status
execute if data storage matchbox:data {cmds:{player_count:true}} run function mb:game/misc/check_player_count
# check dropped items with tag give back
execute if data storage matchbox:data {cmds:{check_give_back:true}} run function mb:items/dropped_giveback
# swap
execute if data storage matchbox:data {cmds:{check_swap:true}} run function mb:swap/check_swap
# check spark mark
execute if data storage matchbox:data {cmds:{check_s_mark:true}} run function mb:mark/spark/check_mark
# check medic mark
execute if data storage matchbox:data {cmds:{check_m_mark:true}} run function mb:mark/medic/check_mark
# check arrow being used
execute if data storage matchbox:data {cmds:{check_arrow:true}} run \
execute as @a[scores={arrow=1}] as @s if predicate mb:arrow/shot_arrow run scoreboard players set @s arrow 0
# glowing reveals
execute if data storage matchbox:data {cmds:{glowing_reveals:true}} run \
execute as @a[team=sigmas,predicate=mb:arrow/is_glowing,scores={nicks=0..,alive=1}] run function mb:arrow/reveal_player
# check missed arrow
execute if data storage matchbox:data {cmds:{check_missed_arrow:true}} run \
execute if entity @e[nbt={item:{id:"minecraft:spectral_arrow",tag:{give_back:1b}},inGround:1b}] run kill @e[nbt={item:{id:"minecraft:spectral_arrow",tag:{give_back:1b}},inGround:1b}]
# tp nametags
execute if data storage matchbox:data {cmds:{tp_nametags:true}} run function mb:nametags/tp_nametags
# chat
execute if data storage matchbox:data {cmds:{chat:true}} run \
execute as @a[team=sigmas,scores={nicks=0..}] if data entity @s Inventory[{tag:{Chat:1b}}].tag.pages[0] run \
function mb:chat/chat
# additional chat stuff if u sign the freaking book empty
execute if data storage matchbox:data {cmds:{chat:true}} run \
execute as @a[team=sigmas,scores={nicks=0..}] if data entity @s Inventory[{id:"minecraft:written_book",tag:{Chat:1b}}] run \
clear @s written_book{Chat:1b}
